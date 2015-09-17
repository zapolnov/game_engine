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
#include "Mesh.h"
#include "engine/core/Services.h"

namespace Engine
{
    Mesh::Mesh()
    {
        mVertexBuffer = Services::renderer()->createVertexBuffer();
        mIndexBuffer = Services::renderer()->createIndexBuffer();
    }

    Mesh::~Mesh()
    {
    }

    void Mesh::setData(const MeshDataPtr& data, BufferUsage usage)
    {
        mElements = data->elements();

        const auto& vertices = data->vertexData();
        mVertexBuffer->setData(vertices.data(), vertices.size(), usage);

        const auto& indices = data->indexData();
        mIndexBuffer->setData(indices.data(), indices.size(), usage);
    }

    void Mesh::setData(MeshDataPtr&& data, BufferUsage usage)
    {
        mElements = std::move(data->moveElements());

        const auto& vertices = data->vertexData();
        mVertexBuffer->setData(vertices.data(), vertices.size(), usage);

        const auto& indices = data->indexData();
        mIndexBuffer->setData(indices.data(), indices.size(), usage);
    }
}
