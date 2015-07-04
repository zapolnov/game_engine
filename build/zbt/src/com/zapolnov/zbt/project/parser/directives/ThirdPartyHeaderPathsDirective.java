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
package com.zapolnov.zbt.project.parser.directives;

import com.zapolnov.zbt.project.parser.AbstractProjectDirectiveVisitor;
import com.zapolnov.zbt.project.parser.ProjectDirective;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public final class ThirdPartyHeaderPathsDirective extends ProjectDirective
{
    private final List<File> headerPaths;

    public ThirdPartyHeaderPathsDirective(List<File> headerPaths)
    {
        this.headerPaths = new ArrayList<>(headerPaths);
    }

    public List<File> headerPaths()
    {
        return Collections.unmodifiableList(headerPaths);
    }

    @Override public void clearCaches()
    {
    }

    @Override public void visit(AbstractProjectDirectiveVisitor visitor)
    {
        visitor.visitDirective(this);
        visitor.visitThirdPartyHeaderPaths(this);
    }
}
