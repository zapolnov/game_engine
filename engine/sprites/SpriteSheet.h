/*
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

#pragma once
#include "engine/core/macros.h"
#include "engine/interfaces/sprites/ISpriteSheet.h"
#include "engine/interfaces/sprites/ISpriteSheetLoader.h"
#include "engine/interfaces/io/IFile.h"
#include <mutex>
#include <unordered_map>
#include <vector>
#include <memory>

namespace Engine
{
    class SpriteSheet : public ISpriteSheet, public std::enable_shared_from_this<SpriteSheet>
    {
    public:
        struct Element
        {
            TexturePtr texture;
            Quad originalQuad;
            Quad trimmedQuad;
            Quad textureCoordinates;
        };

        SpriteSheet();
        ~SpriteSheet();

        void addSprite(const std::string& name, std::shared_ptr<Element>&& element);
        SpritePtr getSprite(const std::string& name) override;

        bool load(const std::string& fileName);
        bool load(const FilePtr& file);
        bool load(IFile* file);

        void loadPendingResources();

        static SpriteSheetPtr fromFile(const std::string& name);
        static SpriteSheetPtr fromFile(const FilePtr& file);
        static SpriteSheetPtr fromFile(IFile* file);

        static void registerLoader(std::unique_ptr<ISpriteSheetLoader>&& loader);
        template <typename TYPE, typename... ARGS> static void registerLoader(ARGS&&... args)
            { registerLoader(std::unique_ptr<TYPE>(new TYPE(std::forward<ARGS>(args)...))); }

    private:
        static std::vector<std::unique_ptr<ISpriteSheetLoader>> mSpriteSheetLoaders;
        static std::mutex mSpriteSheetLoadersMutex;

        std::unordered_map<std::string, std::shared_ptr<Element>> mSprites;

        Z_DISABLE_COPY(SpriteSheet);
    };
}
