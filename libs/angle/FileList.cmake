
set(source_files
    src/common/angleutils.cpp
    src/common/angleutils.h
    src/common/BitSetIterator.h
    src/common/debug.cpp
    src/common/debug.h
    src/common/event_tracer.cpp
    src/common/event_tracer.h
    src/common/Float16ToFloat32.cpp
    src/common/mathutil.cpp
    src/common/mathutil.h
    src/common/matrix_utils.h
    src/common/MemoryBuffer.cpp
    src/common/MemoryBuffer.h
    src/common/Optional.h
    src/common/platform.h
    src/common/string_utils.cpp
    src/common/string_utils.h
    src/common/tls.cpp
    src/common/tls.h
    src/common/utilities.cpp
    src/common/utilities.h
    src/common/version.h
    src/compiler/preprocessor/DiagnosticsBase.cpp
    src/compiler/preprocessor/DiagnosticsBase.h
    src/compiler/preprocessor/DirectiveHandlerBase.cpp
    src/compiler/preprocessor/DirectiveHandlerBase.h
    src/compiler/preprocessor/DirectiveParser.cpp
    src/compiler/preprocessor/DirectiveParser.h
    src/compiler/preprocessor/ExpressionParser.cpp
    src/compiler/preprocessor/ExpressionParser.h
    src/compiler/preprocessor/Input.cpp
    src/compiler/preprocessor/Input.h
    src/compiler/preprocessor/Lexer.cpp
    src/compiler/preprocessor/Lexer.h
    src/compiler/preprocessor/Macro.cpp
    src/compiler/preprocessor/Macro.h
    src/compiler/preprocessor/MacroExpander.cpp
    src/compiler/preprocessor/MacroExpander.h
    src/compiler/preprocessor/numeric_lex.h
    src/compiler/preprocessor/pp_utils.h
    src/compiler/preprocessor/Preprocessor.cpp
    src/compiler/preprocessor/Preprocessor.h
    src/compiler/preprocessor/SourceLocation.h
    src/compiler/preprocessor/Token.cpp
    src/compiler/preprocessor/Token.h
    src/compiler/preprocessor/Tokenizer.cpp
    src/compiler/preprocessor/Tokenizer.h
    src/compiler/translator/depgraph/DependencyGraph.cpp
    src/compiler/translator/depgraph/DependencyGraph.h
    src/compiler/translator/depgraph/DependencyGraphBuilder.cpp
    src/compiler/translator/depgraph/DependencyGraphBuilder.h
    src/compiler/translator/depgraph/DependencyGraphOutput.cpp
    src/compiler/translator/depgraph/DependencyGraphOutput.h
    src/compiler/translator/depgraph/DependencyGraphTraverse.cpp
    src/compiler/translator/timing/RestrictFragmentShaderTiming.cpp
    src/compiler/translator/timing/RestrictFragmentShaderTiming.h
    src/compiler/translator/timing/RestrictVertexShaderTiming.cpp
    src/compiler/translator/timing/RestrictVertexShaderTiming.h
    src/compiler/translator/ArrayReturnValueToOutParameter.cpp
    src/compiler/translator/ArrayReturnValueToOutParameter.h
    src/compiler/translator/ASTMetadataHLSL.cpp
    src/compiler/translator/ASTMetadataHLSL.h
    src/compiler/translator/BaseTypes.h
    src/compiler/translator/blocklayout.cpp
    src/compiler/translator/blocklayout.h
    src/compiler/translator/blocklayoutHLSL.cpp
    src/compiler/translator/blocklayoutHLSL.h
    src/compiler/translator/BuiltInFunctionEmulator.cpp
    src/compiler/translator/BuiltInFunctionEmulator.h
    src/compiler/translator/BuiltInFunctionEmulatorGLSL.cpp
    src/compiler/translator/BuiltInFunctionEmulatorGLSL.h
    src/compiler/translator/BuiltInFunctionEmulatorHLSL.cpp
    src/compiler/translator/BuiltInFunctionEmulatorHLSL.h
    src/compiler/translator/Cache.cpp
    src/compiler/translator/Cache.h
    src/compiler/translator/CallDAG.cpp
    src/compiler/translator/CallDAG.h
    src/compiler/translator/CodeGen.cpp
    src/compiler/translator/Common.h
    src/compiler/translator/Compiler.cpp
    src/compiler/translator/Compiler.h
    src/compiler/translator/ConstantUnion.h
    src/compiler/translator/Diagnostics.cpp
    src/compiler/translator/Diagnostics.h
    src/compiler/translator/DirectiveHandler.cpp
    src/compiler/translator/DirectiveHandler.h
    src/compiler/translator/EmulatePrecision.cpp
    src/compiler/translator/EmulatePrecision.h
    src/compiler/translator/ExtensionBehavior.h
    src/compiler/translator/FlagStd140Structs.cpp
    src/compiler/translator/FlagStd140Structs.h
    src/compiler/translator/ForLoopUnroll.cpp
    src/compiler/translator/ForLoopUnroll.h
    src/compiler/translator/generate_parser.sh
    src/compiler/translator/glslang.h
    src/compiler/translator/glslang_lex.cpp
    src/compiler/translator/glslang_tab.cpp
    src/compiler/translator/glslang_tab.h
    src/compiler/translator/HashNames.h
    src/compiler/translator/InfoSink.cpp
    src/compiler/translator/InfoSink.h
    src/compiler/translator/Initialize.cpp
    src/compiler/translator/Initialize.h
    src/compiler/translator/InitializeDll.cpp
    src/compiler/translator/InitializeDll.h
    src/compiler/translator/InitializeGlobals.h
    src/compiler/translator/InitializeParseContext.cpp
    src/compiler/translator/InitializeParseContext.h
    src/compiler/translator/InitializeVariables.cpp
    src/compiler/translator/InitializeVariables.h
    src/compiler/translator/Intermediate.cpp
    src/compiler/translator/Intermediate.h
    src/compiler/translator/IntermNode.cpp
    src/compiler/translator/IntermNode.h
    src/compiler/translator/intermOut.cpp
    src/compiler/translator/IntermTraverse.cpp
    src/compiler/translator/length_limits.h
    src/compiler/translator/LoopInfo.cpp
    src/compiler/translator/LoopInfo.h
    src/compiler/translator/MMap.h
    src/compiler/translator/NodeSearch.h
    src/compiler/translator/Operator.cpp
    src/compiler/translator/Operator.h
    src/compiler/translator/OutputESSL.cpp
    src/compiler/translator/OutputESSL.h
    src/compiler/translator/OutputGLSL.cpp
    src/compiler/translator/OutputGLSL.h
    src/compiler/translator/OutputGLSLBase.cpp
    src/compiler/translator/OutputGLSLBase.h
    src/compiler/translator/OutputHLSL.cpp
    src/compiler/translator/OutputHLSL.h
    src/compiler/translator/parseConst.cpp
    src/compiler/translator/ParseContext.cpp
    src/compiler/translator/ParseContext.h
    src/compiler/translator/PoolAlloc.cpp
    src/compiler/translator/PoolAlloc.h
    src/compiler/translator/Pragma.h
    src/compiler/translator/PruneEmptyDeclarations.cpp
    src/compiler/translator/PruneEmptyDeclarations.h
    src/compiler/translator/RecordConstantPrecision.cpp
    src/compiler/translator/RecordConstantPrecision.h
    src/compiler/translator/RegenerateStructNames.cpp
    src/compiler/translator/RegenerateStructNames.h
    src/compiler/translator/RemovePow.cpp
    src/compiler/translator/RemovePow.h
    src/compiler/translator/RemoveSwitchFallThrough.cpp
    src/compiler/translator/RemoveSwitchFallThrough.h
    src/compiler/translator/RenameFunction.h
    src/compiler/translator/RewriteElseBlocks.cpp
    src/compiler/translator/RewriteElseBlocks.h
    src/compiler/translator/ScalarizeVecAndMatConstructorArgs.cpp
    src/compiler/translator/ScalarizeVecAndMatConstructorArgs.h
    src/compiler/translator/SearchSymbol.cpp
    src/compiler/translator/SearchSymbol.h
    src/compiler/translator/SeparateArrayInitialization.cpp
    src/compiler/translator/SeparateArrayInitialization.h
    src/compiler/translator/SeparateDeclarations.cpp
    src/compiler/translator/SeparateDeclarations.h
    src/compiler/translator/SeparateExpressionsReturningArrays.cpp
    src/compiler/translator/SeparateExpressionsReturningArrays.h
    src/compiler/translator/ShaderLang.cpp
    src/compiler/translator/ShaderVars.cpp
    src/compiler/translator/StructureHLSL.cpp
    src/compiler/translator/StructureHLSL.h
    src/compiler/translator/SymbolTable.cpp
    src/compiler/translator/SymbolTable.h
    src/compiler/translator/TranslatorESSL.cpp
    src/compiler/translator/TranslatorESSL.h
    src/compiler/translator/TranslatorGLSL.cpp
    src/compiler/translator/TranslatorGLSL.h
    src/compiler/translator/TranslatorHLSL.cpp
    src/compiler/translator/TranslatorHLSL.h
    src/compiler/translator/Types.cpp
    src/compiler/translator/Types.h
    src/compiler/translator/UnfoldShortCircuitAST.cpp
    src/compiler/translator/UnfoldShortCircuitAST.h
    src/compiler/translator/UnfoldShortCircuitToIf.cpp
    src/compiler/translator/UnfoldShortCircuitToIf.h
    src/compiler/translator/UniformHLSL.cpp
    src/compiler/translator/UniformHLSL.h
    src/compiler/translator/util.cpp
    src/compiler/translator/util.h
    src/compiler/translator/UtilsHLSL.cpp
    src/compiler/translator/UtilsHLSL.h
    src/compiler/translator/ValidateGlobalInitializer.cpp
    src/compiler/translator/ValidateGlobalInitializer.h
    src/compiler/translator/ValidateLimitations.cpp
    src/compiler/translator/ValidateLimitations.h
    src/compiler/translator/ValidateOutputs.cpp
    src/compiler/translator/ValidateOutputs.h
    src/compiler/translator/ValidateSwitch.cpp
    src/compiler/translator/ValidateSwitch.h
    src/compiler/translator/VariableInfo.cpp
    src/compiler/translator/VariableInfo.h
    src/compiler/translator/VariablePacker.cpp
    src/compiler/translator/VariablePacker.h
    src/compiler/translator/VersionGLSL.cpp
    src/compiler/translator/VersionGLSL.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/buffertotexture11_gs.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/buffertotexture11_ps_4f.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/buffertotexture11_ps_4i.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/buffertotexture11_ps_4ui.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/buffertotexture11_vs.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/clearfloat11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/clearfloat11vs.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/clearfloat11_fl9ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/clearsint11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/clearsint11vs.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/clearuint11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/clearuint11vs.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthrough2d11vs.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthrough3d11gs.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthrough3d11vs.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughdepth2d11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughlum2d11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughlum3d11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughlumalpha2d11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughlumalpha3d11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughr2d11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughr2di11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughr2dui11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughr3d11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughr3di11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughr3dui11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrg2d11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrg2di11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrg2dui11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrg3d11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrg3di11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrg3dui11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrgb2d11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrgb2di11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrgb2dui11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrgb3d11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrgb3di11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrgb3dui11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrgba2d11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrgba2di11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrgba2dui11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrgba3d11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrgba3di11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/passthroughrgba3dui11ps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/swizzlef2darrayps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/swizzlef2dps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/swizzlef3dps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/swizzlei2darrayps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/swizzlei2dps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/swizzlei3dps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/swizzleui2darrayps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/swizzleui2dps.h
    src/libANGLE/renderer/d3d/d3d11/shaders/compiled/swizzleui3dps.h
    src/libANGLE/renderer/d3d/d3d11/Blit11.cpp
    src/libANGLE/renderer/d3d/d3d11/Blit11.h
    src/libANGLE/renderer/d3d/d3d11/Buffer11.cpp
    src/libANGLE/renderer/d3d/d3d11/Buffer11.h
    src/libANGLE/renderer/d3d/d3d11/Clear11.cpp
    src/libANGLE/renderer/d3d/d3d11/Clear11.h
    src/libANGLE/renderer/d3d/d3d11/copyvertex.h
    src/libANGLE/renderer/d3d/d3d11/copyvertex.inl
    src/libANGLE/renderer/d3d/d3d11/DebugAnnotator11.cpp
    src/libANGLE/renderer/d3d/d3d11/DebugAnnotator11.h
    src/libANGLE/renderer/d3d/d3d11/dxgi_support_table.cpp
    src/libANGLE/renderer/d3d/d3d11/dxgi_support_table.h
    src/libANGLE/renderer/d3d/d3d11/Fence11.cpp
    src/libANGLE/renderer/d3d/d3d11/Fence11.h
    src/libANGLE/renderer/d3d/d3d11/formatutils11.cpp
    src/libANGLE/renderer/d3d/d3d11/formatutils11.h
    src/libANGLE/renderer/d3d/d3d11/Framebuffer11.cpp
    src/libANGLE/renderer/d3d/d3d11/Framebuffer11.h
    src/libANGLE/renderer/d3d/d3d11/Image11.cpp
    src/libANGLE/renderer/d3d/d3d11/Image11.h
    src/libANGLE/renderer/d3d/d3d11/IndexBuffer11.cpp
    src/libANGLE/renderer/d3d/d3d11/IndexBuffer11.h
    src/libANGLE/renderer/d3d/d3d11/InputLayoutCache.cpp
    src/libANGLE/renderer/d3d/d3d11/InputLayoutCache.h
    src/libANGLE/renderer/d3d/d3d11/NativeWindow.h
    src/libANGLE/renderer/d3d/d3d11/PixelTransfer11.cpp
    src/libANGLE/renderer/d3d/d3d11/PixelTransfer11.h
    src/libANGLE/renderer/d3d/d3d11/Query11.cpp
    src/libANGLE/renderer/d3d/d3d11/Query11.h
    src/libANGLE/renderer/d3d/d3d11/Renderer11.cpp
    src/libANGLE/renderer/d3d/d3d11/Renderer11.h
    src/libANGLE/renderer/d3d/d3d11/renderer11_utils.cpp
    src/libANGLE/renderer/d3d/d3d11/renderer11_utils.h
    src/libANGLE/renderer/d3d/d3d11/RenderStateCache.cpp
    src/libANGLE/renderer/d3d/d3d11/RenderStateCache.h
    src/libANGLE/renderer/d3d/d3d11/RenderTarget11.cpp
    src/libANGLE/renderer/d3d/d3d11/RenderTarget11.h
    src/libANGLE/renderer/d3d/d3d11/ShaderExecutable11.cpp
    src/libANGLE/renderer/d3d/d3d11/ShaderExecutable11.h
    src/libANGLE/renderer/d3d/d3d11/SwapChain11.cpp
    src/libANGLE/renderer/d3d/d3d11/SwapChain11.h
    src/libANGLE/renderer/d3d/d3d11/TextureStorage11.cpp
    src/libANGLE/renderer/d3d/d3d11/TextureStorage11.h
    src/libANGLE/renderer/d3d/d3d11/Trim11.cpp
    src/libANGLE/renderer/d3d/d3d11/Trim11.h
    src/libANGLE/renderer/d3d/d3d11/VertexArray11.h
    src/libANGLE/renderer/d3d/d3d11/VertexBuffer11.cpp
    src/libANGLE/renderer/d3d/d3d11/VertexBuffer11.h
    src/libANGLE/renderer/d3d/BufferD3D.cpp
    src/libANGLE/renderer/d3d/BufferD3D.h
    src/libANGLE/renderer/d3d/CompilerD3D.cpp
    src/libANGLE/renderer/d3d/CompilerD3D.h
    src/libANGLE/renderer/d3d/copyimage.cpp
    src/libANGLE/renderer/d3d/copyimage.h
    src/libANGLE/renderer/d3d/copyimage.inl
    src/libANGLE/renderer/d3d/DeviceD3D.cpp
    src/libANGLE/renderer/d3d/DeviceD3D.h
    src/libANGLE/renderer/d3d/DisplayD3D.cpp
    src/libANGLE/renderer/d3d/DisplayD3D.h
    src/libANGLE/renderer/d3d/DynamicHLSL.cpp
    src/libANGLE/renderer/d3d/DynamicHLSL.h
    src/libANGLE/renderer/d3d/formatutilsD3D.cpp
    src/libANGLE/renderer/d3d/formatutilsD3D.h
    src/libANGLE/renderer/d3d/FramebufferD3D.cpp
    src/libANGLE/renderer/d3d/FramebufferD3D.h
    src/libANGLE/renderer/d3d/generatemip.h
    src/libANGLE/renderer/d3d/generatemip.inl
    src/libANGLE/renderer/d3d/HLSLCompiler.cpp
    src/libANGLE/renderer/d3d/HLSLCompiler.h
    src/libANGLE/renderer/d3d/ImageD3D.cpp
    src/libANGLE/renderer/d3d/ImageD3D.h
    src/libANGLE/renderer/d3d/imageformats.h
    src/libANGLE/renderer/d3d/IndexBuffer.cpp
    src/libANGLE/renderer/d3d/IndexBuffer.h
    src/libANGLE/renderer/d3d/IndexDataManager.cpp
    src/libANGLE/renderer/d3d/IndexDataManager.h
    src/libANGLE/renderer/d3d/loadimage.cpp
    src/libANGLE/renderer/d3d/loadimage.h
    src/libANGLE/renderer/d3d/loadimage.inl
    src/libANGLE/renderer/d3d/loadimageSSE2.cpp
    src/libANGLE/renderer/d3d/ProgramD3D.cpp
    src/libANGLE/renderer/d3d/ProgramD3D.h
    src/libANGLE/renderer/d3d/RenderbufferD3D.cpp
    src/libANGLE/renderer/d3d/RenderbufferD3D.h
    src/libANGLE/renderer/d3d/RendererD3D.cpp
    src/libANGLE/renderer/d3d/RendererD3D.h
    src/libANGLE/renderer/d3d/RenderTargetD3D.cpp
    src/libANGLE/renderer/d3d/RenderTargetD3D.h
    src/libANGLE/renderer/d3d/ShaderD3D.cpp
    src/libANGLE/renderer/d3d/ShaderD3D.h
    src/libANGLE/renderer/d3d/ShaderExecutableD3D.cpp
    src/libANGLE/renderer/d3d/ShaderExecutableD3D.h
    src/libANGLE/renderer/d3d/SurfaceD3D.cpp
    src/libANGLE/renderer/d3d/SurfaceD3D.h
    src/libANGLE/renderer/d3d/SwapChainD3D.h
    src/libANGLE/renderer/d3d/TextureD3D.cpp
    src/libANGLE/renderer/d3d/TextureD3D.h
    src/libANGLE/renderer/d3d/TextureStorage.h
    src/libANGLE/renderer/d3d/TransformFeedbackD3D.cpp
    src/libANGLE/renderer/d3d/TransformFeedbackD3D.h
    src/libANGLE/renderer/d3d/VertexBuffer.cpp
    src/libANGLE/renderer/d3d/VertexBuffer.h
    src/libANGLE/renderer/d3d/VertexDataManager.cpp
    src/libANGLE/renderer/d3d/VertexDataManager.h
    src/libANGLE/renderer/d3d/WorkaroundsD3D.h
    src/libANGLE/renderer/BufferImpl.h
    src/libANGLE/renderer/CompilerImpl.h
    src/libANGLE/renderer/DeviceImpl.cpp
    src/libANGLE/renderer/DeviceImpl.h
    src/libANGLE/renderer/DisplayImpl.cpp
    src/libANGLE/renderer/DisplayImpl.h
    src/libANGLE/renderer/FenceNVImpl.h
    src/libANGLE/renderer/FenceSyncImpl.h
    src/libANGLE/renderer/FramebufferImpl.h
    src/libANGLE/renderer/ImageImpl.h
    src/libANGLE/renderer/ImplFactory.h
    src/libANGLE/renderer/ProgramImpl.cpp
    src/libANGLE/renderer/ProgramImpl.h
    src/libANGLE/renderer/QueryImpl.h
    src/libANGLE/renderer/RenderbufferImpl.h
    src/libANGLE/renderer/Renderer.cpp
    src/libANGLE/renderer/Renderer.h
    src/libANGLE/renderer/ShaderImpl.h
    src/libANGLE/renderer/SurfaceImpl.cpp
    src/libANGLE/renderer/SurfaceImpl.h
    src/libANGLE/renderer/TextureImpl.h
    src/libANGLE/renderer/TransformFeedbackImpl.h
    src/libANGLE/renderer/VertexArrayImpl.h
    src/libANGLE/angletypes.cpp
    src/libANGLE/angletypes.h
    src/libANGLE/angletypes.inl
    src/libANGLE/AttributeMap.cpp
    src/libANGLE/AttributeMap.h
    src/libANGLE/BinaryStream.h
    src/libANGLE/Buffer.cpp
    src/libANGLE/Buffer.h
    src/libANGLE/Caps.cpp
    src/libANGLE/Caps.h
    src/libANGLE/Compiler.cpp
    src/libANGLE/Compiler.h
    src/libANGLE/Config.cpp
    src/libANGLE/Config.h
    src/libANGLE/Constants.h
    src/libANGLE/Context.cpp
    src/libANGLE/Context.h
    src/libANGLE/Data.cpp
    src/libANGLE/Data.h
    src/libANGLE/Device.cpp
    src/libANGLE/Device.h
    src/libANGLE/Display.cpp
    src/libANGLE/Display.h
    src/libANGLE/Error.cpp
    src/libANGLE/Error.h
    src/libANGLE/Error.inl
    src/libANGLE/features.h
    src/libANGLE/Fence.cpp
    src/libANGLE/Fence.h
    src/libANGLE/formatutils.cpp
    src/libANGLE/formatutils.h
    src/libANGLE/Framebuffer.cpp
    src/libANGLE/Framebuffer.h
    src/libANGLE/FramebufferAttachment.cpp
    src/libANGLE/FramebufferAttachment.h
    src/libANGLE/HandleAllocator.cpp
    src/libANGLE/HandleAllocator.h
    src/libANGLE/histogram_macros.h
    src/libANGLE/Image.cpp
    src/libANGLE/Image.h
    src/libANGLE/ImageIndex.cpp
    src/libANGLE/ImageIndex.h
    src/libANGLE/IndexRangeCache.cpp
    src/libANGLE/IndexRangeCache.h
    src/libANGLE/Platform.cpp
    src/libANGLE/Program.cpp
    src/libANGLE/Program.h
    src/libANGLE/Query.cpp
    src/libANGLE/Query.h
    src/libANGLE/queryconversions.cpp
    src/libANGLE/queryconversions.h
    src/libANGLE/RefCountObject.cpp
    src/libANGLE/RefCountObject.h
    src/libANGLE/Renderbuffer.cpp
    src/libANGLE/Renderbuffer.h
    src/libANGLE/ResourceManager.cpp
    src/libANGLE/ResourceManager.h
    src/libANGLE/Sampler.cpp
    src/libANGLE/Sampler.h
    src/libANGLE/Shader.cpp
    src/libANGLE/Shader.h
    src/libANGLE/State.cpp
    src/libANGLE/State.h
    src/libANGLE/Surface.cpp
    src/libANGLE/Surface.h
    src/libANGLE/Texture.cpp
    src/libANGLE/Texture.h
    src/libANGLE/TransformFeedback.cpp
    src/libANGLE/TransformFeedback.h
    src/libANGLE/Uniform.cpp
    src/libANGLE/Uniform.h
    src/libANGLE/validationEGL.cpp
    src/libANGLE/validationEGL.h
    src/libANGLE/validationES.cpp
    src/libANGLE/validationES.h
    src/libANGLE/validationES2.cpp
    src/libANGLE/validationES2.h
    src/libANGLE/validationES3.cpp
    src/libANGLE/validationES3.h
    src/libANGLE/Version.h
    src/libANGLE/Version.inl
    src/libANGLE/VertexArray.cpp
    src/libANGLE/VertexArray.h
    src/libANGLE/VertexAttribute.cpp
    src/libANGLE/VertexAttribute.h
    src/libANGLE/VertexAttribute.inl
    src/libEGL/libEGL.cpp
    src/libGLESv2/entry_points_egl.cpp
    src/libGLESv2/entry_points_egl.h
    src/libGLESv2/entry_points_egl_ext.cpp
    src/libGLESv2/entry_points_egl_ext.h
    src/libGLESv2/entry_points_gles_2_0.cpp
    src/libGLESv2/entry_points_gles_2_0.h
    src/libGLESv2/entry_points_gles_2_0_ext.cpp
    src/libGLESv2/entry_points_gles_2_0_ext.h
    src/libGLESv2/entry_points_gles_3_0.cpp
    src/libGLESv2/entry_points_gles_3_0.h
    src/libGLESv2/entry_points_gles_3_0_ext.cpp
    src/libGLESv2/entry_points_gles_3_0_ext.h
    src/libGLESv2/global_state.cpp
    src/libGLESv2/global_state.h
    src/libGLESv2/libGLESv2.cpp
    src/third_party/compiler/ArrayBoundsClamper.cpp
    src/third_party/compiler/ArrayBoundsClamper.h
    src/third_party/khronos/GL/wglext.h
    src/third_party/murmurhash/MurmurHash3.cpp
    src/third_party/murmurhash/MurmurHash3.h
    src/third_party/systeminfo/SystemInfo.cpp
    src/third_party/systeminfo/SystemInfo.h
    src/third_party/trace_event/trace_event.h
    src/commit.h
    pch.h
)

if(B3D_WINPHONE OR B3D_WINSTORE)
    list(APPEND source_files
        src/libANGLE/renderer/d3d/d3d11/winrt/InspectableNativeWindow.cpp
        src/libANGLE/renderer/d3d/d3d11/winrt/InspectableNativeWindow.h
        src/libANGLE/renderer/d3d/d3d11/winrt/SwapChainPanelNativeWindow.cpp
        src/libANGLE/renderer/d3d/d3d11/winrt/SwapChainPanelNativeWindow.h
    )
elseif(B3D_WIN32)
    list(APPEND source_files
        src/libANGLE/renderer/d3d/d3d9/shaders/compiled/componentmaskps.h
        src/libANGLE/renderer/d3d/d3d9/shaders/compiled/flipyvs.h
        src/libANGLE/renderer/d3d/d3d9/shaders/compiled/luminanceps.h
        src/libANGLE/renderer/d3d/d3d9/shaders/compiled/passthroughps.h
        src/libANGLE/renderer/d3d/d3d9/shaders/compiled/standardvs.h
        src/libANGLE/renderer/d3d/d3d9/Blit9.cpp
        src/libANGLE/renderer/d3d/d3d9/Blit9.h
        src/libANGLE/renderer/d3d/d3d9/Buffer9.cpp
        src/libANGLE/renderer/d3d/d3d9/Buffer9.h
        src/libANGLE/renderer/d3d/d3d9/DebugAnnotator9.cpp
        src/libANGLE/renderer/d3d/d3d9/DebugAnnotator9.h
        src/libANGLE/renderer/d3d/d3d9/Fence9.cpp
        src/libANGLE/renderer/d3d/d3d9/Fence9.h
        src/libANGLE/renderer/d3d/d3d9/formatutils9.cpp
        src/libANGLE/renderer/d3d/d3d9/formatutils9.h
        src/libANGLE/renderer/d3d/d3d9/Framebuffer9.cpp
        src/libANGLE/renderer/d3d/d3d9/Framebuffer9.h
        src/libANGLE/renderer/d3d/d3d9/Image9.cpp
        src/libANGLE/renderer/d3d/d3d9/Image9.h
        src/libANGLE/renderer/d3d/d3d9/IndexBuffer9.cpp
        src/libANGLE/renderer/d3d/d3d9/IndexBuffer9.h
        src/libANGLE/renderer/d3d/d3d9/Query9.cpp
        src/libANGLE/renderer/d3d/d3d9/Query9.h
        src/libANGLE/renderer/d3d/d3d9/Renderer9.cpp
        src/libANGLE/renderer/d3d/d3d9/Renderer9.h
        src/libANGLE/renderer/d3d/d3d9/renderer9_utils.cpp
        src/libANGLE/renderer/d3d/d3d9/renderer9_utils.h
        src/libANGLE/renderer/d3d/d3d9/RenderTarget9.cpp
        src/libANGLE/renderer/d3d/d3d9/RenderTarget9.h
        src/libANGLE/renderer/d3d/d3d9/ShaderCache.h
        src/libANGLE/renderer/d3d/d3d9/ShaderExecutable9.cpp
        src/libANGLE/renderer/d3d/d3d9/ShaderExecutable9.h
        src/libANGLE/renderer/d3d/d3d9/SwapChain9.cpp
        src/libANGLE/renderer/d3d/d3d9/SwapChain9.h
        src/libANGLE/renderer/d3d/d3d9/TextureStorage9.cpp
        src/libANGLE/renderer/d3d/d3d9/TextureStorage9.h
        src/libANGLE/renderer/d3d/d3d9/VertexArray9.h
        src/libANGLE/renderer/d3d/d3d9/VertexBuffer9.cpp
        src/libANGLE/renderer/d3d/d3d9/VertexBuffer9.h
        src/libANGLE/renderer/d3d/d3d9/vertexconversion.h
        src/libANGLE/renderer/d3d/d3d9/VertexDeclarationCache.cpp
        src/libANGLE/renderer/d3d/d3d9/VertexDeclarationCache.h
        src/libANGLE/renderer/d3d/d3d11/win32/NativeWindow.cpp
    )
endif()
