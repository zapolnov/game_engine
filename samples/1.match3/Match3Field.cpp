﻿/*
 * Copyright (c) 2015 Nikolay Zapolnov (zapolnov@gmail.com).
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
#include "Match3Field.h"
#include "Match3Listener.h"
#include "core/utility/debug.h"
#include <map>
#include <cstring>
#include <random>

namespace Z
{
    Match3Field::Match3Field(int fieldWidth, int fieldHeight, int8_t numUniqueElements)
        : m_Width(fieldWidth)
        , m_Height(fieldHeight)
        , m_NumUniqueElements(numUniqueElements)
    {
        Z_CHECK(numUniqueElements > 0);
        Z_CHECK(fieldWidth > 0);
        Z_CHECK(fieldHeight > 0);

        if (m_NumUniqueElements < 1)
            m_NumUniqueElements = 1;
        if (m_Width < 1)
            m_Width = 1;
        if (m_Height < 1)
            m_Height = 1;

        std::default_random_engine generator;
        std::uniform_int_distribution<int> distribution(0, m_NumUniqueElements - 1);

        m_Elements = new int8_t[m_Width * m_Height];
        for (int i = 0; i < m_Width * m_Height; i++)
            m_Elements[i] = -1;

        for (int y = 0; y < m_Height; y++) {
            for (int x = 0; x < m_Width; x++) {
                int8_t index;
                do {
                    index = static_cast<int8_t>(distribution(generator));
                } while (cellWillMatch(x, y, index));
                m_Elements[y * m_Width + x] = index;
            }
        }
    }

    Match3Field::~Match3Field()
    {
        delete[] m_Elements;
    }

    int8_t& Match3Field::elementAt(int x, int y)
    {
        Z_CHECK(x >= 0);
        Z_CHECK(y >= 0);
        Z_CHECK(x < m_Width);
        Z_CHECK(y < m_Height);

        if (x >= 0 && x < m_Width && y >= 0 && y < m_Height)
            return m_Elements[y * m_Width + x];

        static int8_t dummy = -1;
        return dummy;
    }

    int8_t Match3Field::elementAt(int x, int y) const
    {
        Z_CHECK(x >= 0);
        Z_CHECK(y >= 0);
        Z_CHECK(x < m_Width);
        Z_CHECK(y < m_Height);

        if (x >= 0 && x < m_Width && y >= 0 && y < m_Height)
            return m_Elements[y * m_Width + x];

        return -1;
    }

    bool Match3Field::cellWillMatch(int x, int y, int8_t id)
    {
        Z_CHECK(id >= 0);
        if (id < 0)
            return false;

        int w = m_Width;
        int h = m_Height;

        int l2 = x - 2 >= 0 ? elementAt(x - 2, y) : -1;
        int l1 = x - 1 >= 0 ? elementAt(x - 1, y) : -1;
        int r1 = x + 1 <  w ? elementAt(x + 1, y) : -1;
        int r2 = x + 2 <  w ? elementAt(x + 2, y) : -1;

        int u2 = y - 2 >= 0 ? elementAt(x, y - 2) : -1;
        int u1 = y - 1 >= 0 ? elementAt(x, y - 1) : -1;
        int d1 = y + 1 <  h ? elementAt(x, y + 1) : -1;
        int d2 = y + 2 <  h ? elementAt(x, y + 2) : -1;

        if (l1 == id && l2 == id)
            return true;
        if (l1 == id && r1 == id)
            return true;
        if (r1 == id && r2 == id)
            return true;

        if (u1 == id && u2 == id)
            return true;
        if (u1 == id && d1 == id)
            return true;
        if (d1 == id && d2 == id)
            return true;

        return false;
    }

    bool Match3Field::swapItems(int x1, int y1, int x2, int y2, bool notifyListenerOnFailure)
    {
        Z_CHECK(x1 >= 0);
        Z_CHECK(y1 >= 0);
        Z_CHECK(x1 < m_Width);
        Z_CHECK(y1 < m_Height);

        Z_CHECK(x2 >= 0);
        Z_CHECK(y2 >= 0);
        Z_CHECK(x2 < m_Width);
        Z_CHECK(y2 < m_Height);

        if ((y1 != y2 || (x1 != x2 - 1 && x1 != x2 + 1)) &&
            (x1 != x2 || (y1 != y2 - 1 && y1 != y2 + 1)))
            return false;

        auto& element1 = m_Elements[y1 * m_Width + x1];
        auto& element2 = m_Elements[y2 * m_Width + x2];

        Z_CHECK(element1 >= 0);
        Z_CHECK(element2 >= 0);

        if (element1 == element2)
            return false;

        if (x1 >= 0 && x1 < m_Width && y1 >= 0 && y1 < m_Height &&
            x2 >= 0 && x2 < m_Width && y2 >= 0 && y2 < m_Height &&
            element1 >= 0 && element2 >= 0)
        {
            std::swap(element1, element2);

            if (!cellWillMatch(x1, y1, element1) && !cellWillMatch(x2, y2, element2)) {
                std::swap(element1, element2);

                if (notifyListenerOnFailure) {
                    forEachListener([](Match3Listener* listener) {
                        listener->onItemsSwapFailed();
                    });
                }

                return false;
            }

            forEachListener([x1, y1, x2, y2](Match3Listener* listener) {
                listener->onItemsSwapped(x1, y1, x2, y2);
            });

            return true;
        }

        return false;
    }

    int Match3Field::horizontalMatchLengthFrom(int x, int y) const
    {
        if (x + 2 >= m_Width)
            return 0;

        int8_t x0 = m_Elements[y * m_Width + (x + 0)];
        int8_t x1 = m_Elements[y * m_Width + (x + 1)];
        int8_t x2 = m_Elements[y * m_Width + (x + 2)];
        if (x0 < 0 || x1 != x0 || x2 != x0)
            return 0;

        int count = 3;
        for (; x + count < m_Width; count++) {
            if (m_Elements[y * m_Width + (x + count)] != x0)
                break;
        }

        return count;
    }

    int Match3Field::verticalMatchLengthFrom(int x, int y) const
    {
        if (y + 2 >= m_Height)
            return 0;

        int8_t y0 = m_Elements[(y + 0) * m_Width + x];
        int8_t y1 = m_Elements[(y + 1) * m_Width + x];
        int8_t y2 = m_Elements[(y + 2) * m_Width + x];
        if (y0 < 0 || y1 != y0 || y2 != y0)
            return 0;

        int count = 3;
        for (; y + count < m_Height; count++) {
            if (m_Elements[(y + count) * m_Width + x] != y0)
                break;
        }

        return count;
    }

    bool Match3Field::killAllMatches()
    {
        std::vector<Chain> chains;

        std::unique_ptr<size_t[]> chainIndices(new size_t[m_Width * m_Height]);
        memset(chainIndices.get(), -1, m_Width * m_Height * sizeof(*chainIndices.get()));

        std::function<void(Chain*, size_t, int, int, int, int)> addCellsToChain;
        addCellsToChain = [this, &addCellsToChain, &chainIndices]
            (Chain* chain, size_t chainIndex, int startX, int startY, int horzMatch, int vertMatch)
        {
            for (int xx = 0; xx < horzMatch; xx++) {
                size_t& index = chainIndices[startY * m_Width + (startX + xx)];
                if (index == size_t(-1)) {
                    index = chainIndex;
                    chain->cells.emplace_back(startX + xx, startY);
                }

                if (xx > 0) {
                    int vertMatch2 = verticalMatchLengthFrom(startX + xx, startY);
                    if (vertMatch2)
                        addCellsToChain(chain, chainIndex, startX + xx, startY, 0, vertMatch2);
                }
            }

            for (int yy = 0; yy < vertMatch; yy++) {
                size_t& index = chainIndices[(startY + yy) * m_Width + startX];
                if (index == size_t(-1)) {
                    index = chainIndex;
                    chain->cells.emplace_back(startX, startY + yy);
                }

                if (yy > 0) {
                    int horzMatch2 = horizontalMatchLengthFrom(startX, startY + yy);
                    if (horzMatch2)
                        addCellsToChain(chain, chainIndex, startX, startY + yy, horzMatch2, 0);
                }
            }
        };

        for (int y = 0; y < m_Height; y++) {
            for (int x = 0; x < m_Width; x++) {

                int horizontalMatch = horizontalMatchLengthFrom(x, y);
                int verticalMatch = verticalMatchLengthFrom(x, y);
                if (!horizontalMatch && !verticalMatch)
                    continue;

                int8_t item = m_Elements[y * m_Width + x];
                size_t chainIndex = 0;
                Chain* chain = nullptr;

                for (int xx = 0; xx < horizontalMatch; xx++) {
                    size_t index = chainIndices[y * m_Width + (x + xx)];
                    if (index != size_t(-1)) {
                        chainIndex = index;
                        chain = &chains[index];
                        break;
                        /*
                      #else
                        if (!chain)
                            chain = &chains[index];
                        else
                            Z_CHECK(chain == &chains[index]);
                        Z_CHECK(chain->element == item);
                      #endif
                        */
                    }
                }
                if (!chain) {
                    for (int yy = 0; yy < verticalMatch; yy++) {
                        size_t index = chainIndices[(y + yy) * m_Width + x];
                        if (index != size_t(-1)) {
                            chainIndex = index;
                            chain = &chains[index];
                            break;
                            /*
                          #else
                            if (!chain)
                                chain = &chains[index];
                            else
                                Z_CHECK(chain == &chains[index]);
                            Z_CHECK(chain->element == item);
                          #endif
                            */
                        }
                    }
                }
                if (!chain) {
                    chainIndex = chains.size();
                    chains.emplace_back();
                    chain = &chains.back();
                    chain->element = item;
                }

                addCellsToChain(chain, chainIndex, x, y, horizontalMatch, verticalMatch);
            }
        }

        if (chains.empty())
            return false;

        forEachListener([&chains](Match3Listener* listener) {
            listener->onChainsMatched(chains);
        });

        /*
        std::stringstream ss;
        ss << "-------------------------------\n";
        for (int y = 0; y < m_Height; y++) {
            for (int x = 0; x < m_Width; x++) {
                size_t index = chainIndices[y * m_Width + x];
                if (index == size_t(-1))
                    ss << '.';
                else {
                    const char* symbol = "xoi@#~=+?????????????????????????";
                    ss << symbol[index];
                }
            }
            ss << '\n';
        }
        ss << "-------------------------------\n";
        Z_LOG(ss.str());
        */

        std::default_random_engine generator;
        std::uniform_int_distribution<int> distribution(0, m_NumUniqueElements - 1);

        std::vector<glm::ivec2> fallenItems;
        std::vector<glm::ivec2> spawnedItems;

        bool hadFallenItems;
        do {
            hadFallenItems = false;

            for (int y = m_Height - 1; y >= 0; y--) {
                for (int x = 0; x < m_Width; x++) {

                    int oldOffset = (y - 1) * m_Width + x;
                    int newOffset = (y - 0) * m_Width + x;

                    if (chainIndices[newOffset] != size_t(-1)) {
                        if (y == 0 || m_Elements[oldOffset] < 0) {
                            m_Elements[newOffset] = static_cast<int8_t>(distribution(generator));
                            chainIndices[newOffset] = size_t(-1);
                            spawnedItems.emplace_back(x, y);
                            hadFallenItems = true;
                        } else if (chainIndices[oldOffset] == size_t(-1)) {
                            m_Elements[newOffset] = m_Elements[oldOffset];
                            chainIndices[oldOffset] = 0;
                            chainIndices[newOffset] = size_t(-1);
                            fallenItems.emplace_back(x, y - 1);
                            hadFallenItems = true;
                        }
                    }
                }
            }

            if (hadFallenItems) {
                forEachListener([&fallenItems, &spawnedItems](Match3Listener* listener) {
                    listener->onMatchesKilled(fallenItems, spawnedItems);
                });
                fallenItems.clear();
                spawnedItems.clear();
            }
        } while (hadFallenItems);

        forEachListener([](Match3Listener* listener) {
            listener->onAllMatchesKilled();
        });

        return true;
    }

    void Match3Field::addListener(Match3Listener* listener)
    {
        m_Listeners.insert(listener);
    }

    void Match3Field::removeListener(Match3Listener* listener)
    {
        m_Listeners.erase(listener);
    }

    void Match3Field::forEachListener(const std::function<void(Match3Listener*)>& iterator)
    {
        if (m_Listeners.empty())
            return;

        std::vector<Match3Listener*> listeners;
        listeners.reserve(m_Listeners.size());
        listeners.insert(listeners.begin(), m_Listeners.begin(), m_Listeners.end());

        for (Match3Listener* listener : listeners)
            iterator(listener);
    }
}
