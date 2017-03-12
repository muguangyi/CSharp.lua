-- Generated by CSharp.lua Compiler 1.0.0.0
local System = System
local Linq = System.Linq.Enumerable
local CSharpLua
local CSharpLuaLuaAst
System.usingDeclare(function (global) 
    CSharpLua = global.CSharpLua
    CSharpLuaLuaAst = CSharpLua.LuaAst
end)
System.namespace("CSharpLua.LuaAst", function (namespace) 
    namespace.class("LuaTypeDeclarationSyntax", function (namespace) 
        local AddStaticReadOnlyAssignmentName, AddDocumentComments, AddClassAttributes, AddMethodAttributes, AddFieldAttributes, AddTypeParameters, AddBaseTypes, AddResultTable, 
        AddResultTable1, AddMethod, AddInitFiled, AddField, AddPropertyOrEvent, AddProperty, AddEvent, SetStaticCtor, 
        getIsNoneCtros, getIsInitStatementExists, AddCtor, AddInitFunction, AddStaticAssignmentNames, CheckStaticCtorFunction, GetInitFunction, CheckCtorsFunction, 
        CheckAttributes, AddAllStatementsTo, Render, __init__, __ctor__
        __init__ = function (this) 
            this.local_ = CSharpLuaLuaAst.LuaTypeLocalAreaSyntax()
            this.methodList_ = CSharpLuaLuaAst.LuaStatementListSyntax()
            this.resultTable_ = CSharpLuaLuaAst.LuaTableInitializerExpression()
            this.staticLazyStatements_ = System.List(CSharpLuaLuaAst.LuaStatementSyntax)()
            this.staticInitStatements_ = System.List(CSharpLuaLuaAst.LuaStatementSyntax)()
            this.staticcCtorStatements_ = System.List(CSharpLuaLuaAst.LuaStatementSyntax)()
            this.staticAssignmentNames_ = System.List(CSharpLuaLuaAst.LuaIdentifierNameSyntax)()
            this.initStatements_ = System.List(CSharpLuaLuaAst.LuaStatementSyntax)()
            this.ctors_ = System.List(CSharpLuaLuaAst.LuaConstructorAdapterExpressionSyntax)()
            this.typeParameters_ = System.List(CSharpLuaLuaAst.LuaParameterSyntax)()
            this.attributes_ = CSharpLuaLuaAst.LuaTableInitializerExpression()
            this.documentComments_ = System.List(CSharpLuaLuaAst.LuaStatementSyntax)()
        end
        __ctor__ = function (this) 
            __init__(this)
            CSharpLuaLuaAst.LuaWrapFunctionStatementSynatx.__ctor__(this)
        end
        AddStaticReadOnlyAssignmentName = function (this, name) 
            if not this.staticAssignmentNames_:Contains(name) then
                this.staticAssignmentNames_:Add(name)
            end
        end
        AddDocumentComments = function (this, commets) 
            this.documentComments_:AddRange(commets)
        end
        AddClassAttributes = function (this, attributes) 
            AddFieldAttributes(this, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Class, attributes)
        end
        AddMethodAttributes = function (this, name, attributes) 
            if #attributes > 0 then
                local table = CSharpLuaLuaAst.LuaTableInitializerExpression()
                table.Items:AddRange(Linq.Select(attributes, function (i) 
                    return CSharpLuaLuaAst.LuaSingleTableItemSyntax(i)
                end, CSharpLuaLuaAst.LuaSingleTableItemSyntax))
                local key = CSharpLuaLuaAst.LuaTableExpressionKeySyntax(name)
                local item = CSharpLuaLuaAst.LuaKeyValueTableItemSyntax(key, table)
                this.attributes_.Items:Add(item)
            end
        end
        AddFieldAttributes = function (this, name, attributes) 
            if #attributes > 0 then
                local table = CSharpLuaLuaAst.LuaTableInitializerExpression()
                table.Items:AddRange(Linq.Select(attributes, function (i) 
                    return CSharpLuaLuaAst.LuaSingleTableItemSyntax(i)
                end, CSharpLuaLuaAst.LuaSingleTableItemSyntax))
                local key = CSharpLuaLuaAst.LuaTableLiteralKeySyntax(name)
                local item = CSharpLuaLuaAst.LuaKeyValueTableItemSyntax(key, table)
                this.attributes_.Items:Add(item)
            end
        end
        AddTypeParameters = function (this, typeParameters) 
            this.typeParameters_:AddRange(typeParameters)
        end
        AddBaseTypes = function (this, baseTypes, hasExtendSelf) 
            local global = CSharpLuaLuaAst.LuaIdentifierNameSyntax.Global
            local table = CSharpLuaLuaAst.LuaTableInitializerExpression()
            for _, baseType in System.each(baseTypes) do
                local memberAccess = CSharpLuaLuaAst.LuaMemberAccessExpressionSyntax(global, baseType, false)
                table.Items:Add(CSharpLuaLuaAst.LuaSingleTableItemSyntax(memberAccess))
            end
            local functionExpression = CSharpLuaLuaAst.LuaFunctionExpressionSyntax()
            functionExpression:AddParameter1(global)
            functionExpression:AddStatement(CSharpLuaLuaAst.LuaReturnStatementSyntax(table))
            AddResultTable1(this, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Inherits, functionExpression)
            if hasExtendSelf then
                AddResultTable1(this, CSharpLuaLuaAst.LuaIdentifierNameSyntax.InheritRecursion, CSharpLuaLuaAst.LuaIdentifierNameSyntax.True)
            end
        end
        AddResultTable = function (this, name) 
            local item = CSharpLuaLuaAst.LuaKeyValueTableItemSyntax(CSharpLuaLuaAst.LuaTableLiteralKeySyntax(name), name)
            this.resultTable_.Items:Add(item)
        end
        AddResultTable1 = function (this, name, value) 
            local item = CSharpLuaLuaAst.LuaKeyValueTableItemSyntax(CSharpLuaLuaAst.LuaTableLiteralKeySyntax(name), value)
            this.resultTable_.Items:Add(item)
        end
        AddMethod = function (this, name, method, isPrivate, isStaticLazy, documentationComments) 
            this.local_.Variables:Add(name)
            local assignment = CSharpLuaLuaAst.LuaAssignmentExpressionSyntax(name, method)
            if documentationComments ~= nil and #documentationComments > 0 then
                local statementList = CSharpLuaLuaAst.LuaStatementListSyntax()
                statementList.Statements:AddRange(documentationComments)
                this.methodList_.Statements:Add(statementList)
            end
            this.methodList_.Statements:Add(CSharpLuaLuaAst.LuaExpressionStatementSyntax(assignment))
            if not isPrivate then
                if isStaticLazy then
                    local thisAssignment = CSharpLuaLuaAst.LuaAssignmentExpressionSyntax(CSharpLuaLuaAst.LuaMemberAccessExpressionSyntax(CSharpLuaLuaAst.LuaIdentifierNameSyntax.This, name, false), name)
                    this.staticLazyStatements_:Add(CSharpLuaLuaAst.LuaExpressionStatementSyntax(thisAssignment))
                else
                    AddResultTable(this, name)
                end
            end
        end
        AddInitFiled = function (this, name, value) 
            local memberAccess = CSharpLuaLuaAst.LuaMemberAccessExpressionSyntax(CSharpLuaLuaAst.LuaIdentifierNameSyntax.This, name, false)
            local assignment = CSharpLuaLuaAst.LuaAssignmentExpressionSyntax(memberAccess, value)
            this.initStatements_:Add(CSharpLuaLuaAst.LuaExpressionStatementSyntax(assignment))
        end
        AddField = function (this, name, value, isImmutable, isStatic, isPrivate, isReadOnly) 
            if isStatic then
                if isPrivate then
                    this.local_.Variables:Add(name)
                    if value ~= nil then
                        local assignment = CSharpLuaLuaAst.LuaAssignmentExpressionSyntax(name, value)
                        if isImmutable then
                            this.methodList_.Statements:Add(CSharpLuaLuaAst.LuaExpressionStatementSyntax(assignment))
                        else
                            this.staticInitStatements_:Add(CSharpLuaLuaAst.LuaExpressionStatementSyntax(assignment))
                        end
                    end
                else
                    if isReadOnly then
                        this.local_.Variables:Add(name)
                        if value ~= nil then
                            local assignment = CSharpLuaLuaAst.LuaAssignmentExpressionSyntax(name, value)
                            this.staticInitStatements_:Add(CSharpLuaLuaAst.LuaExpressionStatementSyntax(assignment))
                            this.staticAssignmentNames_:Add(name)
                        end
                    else
                        if value ~= nil then
                            local assignment = CSharpLuaLuaAst.LuaAssignmentExpressionSyntax(CSharpLuaLuaAst.LuaMemberAccessExpressionSyntax(CSharpLuaLuaAst.LuaIdentifierNameSyntax.This, name, false), value)
                            this.staticInitStatements_:Add(CSharpLuaLuaAst.LuaExpressionStatementSyntax(assignment))
                        end
                    end
                end
            else
                if value ~= nil then
                    if isImmutable then
                        AddResultTable1(this, name, value)
                    else
                        AddInitFiled(this, name, value)
                    end
                end
            end
        end
        AddPropertyOrEvent = function (this, isProperty, name, value, isImmutable, isStatic, isPrivate) 
            local initMethodIdentifier
            local get, set
            if isProperty then
                initMethodIdentifier = CSharpLuaLuaAst.LuaIdentifierNameSyntax.Property
                get = CSharpLuaLuaAst.LuaPropertyOrEventIdentifierNameSyntax:new(2, true, true, name)
                set = CSharpLuaLuaAst.LuaPropertyOrEventIdentifierNameSyntax:new(2, true, false, name)
            else
                initMethodIdentifier = CSharpLuaLuaAst.LuaIdentifierNameSyntax.Event
                get = CSharpLuaLuaAst.LuaPropertyOrEventIdentifierNameSyntax:new(2, false, true, name)
                set = CSharpLuaLuaAst.LuaPropertyOrEventIdentifierNameSyntax:new(2, false, false, name)
            end

            this.local_.Variables:Add(get)
            this.local_.Variables:Add(set)
            local assignment = CSharpLuaLuaAst.LuaMultipleAssignmentExpressionSyntax()
            assignment.Lefts:Add(get)
            assignment.Lefts:Add(set)
            local invocation = CSharpLuaLuaAst.LuaInvocationExpressionSyntax:new(1, initMethodIdentifier)
            invocation:AddArgument(CSharpLuaLuaAst.LuaStringLiteralExpressionSyntax(name))
            assignment.Rights:Add(invocation)
            this.methodList_.Statements:Add(CSharpLuaLuaAst.LuaExpressionStatementSyntax(assignment))

            if value ~= nil then
                if isStatic then
                    if isImmutable then
                        AddResultTable1(this, name, value)
                    else
                        local thisAssignment = CSharpLuaLuaAst.LuaAssignmentExpressionSyntax(name, value)
                        this.staticLazyStatements_:Add(CSharpLuaLuaAst.LuaExpressionStatementSyntax(thisAssignment))
                    end
                else
                    if isImmutable then
                        AddResultTable1(this, name, value)
                    else
                        AddInitFiled(this, name, value)
                    end
                end
            end

            if not isPrivate then
                AddResultTable(this, get)
                AddResultTable(this, set)
            end
        end
        AddProperty = function (this, name, value, isImmutable, isStatic, isPrivate) 
            AddPropertyOrEvent(this, true, name, value, isImmutable, isStatic, isPrivate)
        end
        AddEvent = function (this, name, value, isImmutable, isStatic, isPrivate) 
            AddPropertyOrEvent(this, false, name, value, isImmutable, isStatic, isPrivate)
        end
        SetStaticCtor = function (this, function_) 
            assert(#this.staticcCtorStatements_ == 0)
            this.staticcCtorStatements_:AddRange(function_.Body.Statements)
        end
        getIsNoneCtros = function (this) 
            return #this.ctors_ == 0
        end
        getIsInitStatementExists = function (this) 
            return #this.initStatements_ > 0
        end
        AddCtor = function (this, function_, isZeroParameters) 
            if isZeroParameters then
                this.ctors_:Insert(0, function_)
            else
                this.ctors_:Add(function_)
            end
        end
        AddInitFunction = function (this, body, name, initFunction, isAddItem) 
            this.local_.Variables:Add(name)
            body.Statements:Add(CSharpLuaLuaAst.LuaExpressionStatementSyntax(CSharpLuaLuaAst.LuaAssignmentExpressionSyntax(name, initFunction)))
            if isAddItem then
                AddResultTable(this, name)
            end
        end
        AddStaticAssignmentNames = function (this, body) 
            if #this.staticAssignmentNames_ > 0 then
                local assignment = CSharpLuaLuaAst.LuaMultipleAssignmentExpressionSyntax()
                for _, identifierName in System.each(this.staticAssignmentNames_) do
                    local memberAccess = CSharpLuaLuaAst.LuaMemberAccessExpressionSyntax(CSharpLuaLuaAst.LuaIdentifierNameSyntax.This, identifierName, false)
                    assignment.Lefts:Add(memberAccess)
                    assignment.Rights:Add(identifierName)
                end
                body.Statements:Add(CSharpLuaLuaAst.LuaExpressionStatementSyntax(assignment))
            end
        end
        CheckStaticCtorFunction = function (this, body) 
            local statements = System.List(CSharpLuaLuaAst.LuaStatementSyntax)()
            statements:AddRange(this.staticLazyStatements_)
            statements:AddRange(this.staticInitStatements_)
            statements:AddRange(this.staticcCtorStatements_)
            if #statements > 0 then
                local staticCtor = CSharpLuaLuaAst.LuaFunctionExpressionSyntax()
                staticCtor:AddParameter1(CSharpLuaLuaAst.LuaIdentifierNameSyntax.This)
                staticCtor.Body.Statements:AddRange(statements)
                AddStaticAssignmentNames(this, staticCtor.Body)
                AddInitFunction(this, body, CSharpLuaLuaAst.LuaIdentifierNameSyntax.StaticCtor, staticCtor, true)
            end
        end
        GetInitFunction = function (this) 
            local initFuntion = CSharpLuaLuaAst.LuaFunctionExpressionSyntax()
            initFuntion:AddParameter1(CSharpLuaLuaAst.LuaIdentifierNameSyntax.This)
            initFuntion.Body.Statements:AddRange(this.initStatements_)
            return initFuntion
        end
        CheckCtorsFunction = function (this, body) 
            local hasInit = #this.initStatements_ > 0
            local hasCtors = #this.ctors_ > 0

            if hasCtors then
                if hasInit then
                    local initIdentifier = CSharpLuaLuaAst.LuaIdentifierNameSyntax.Init
                    AddInitFunction(this, body, initIdentifier, GetInitFunction(this), false)
                    for _, ctor in System.each(this.ctors_) do
                        if not ctor.IsInvokeThisCtor then
                            local invocationInit = CSharpLuaLuaAst.LuaInvocationExpressionSyntax:new(2, initIdentifier, CSharpLuaLuaAst.LuaIdentifierNameSyntax.This)
                            ctor.Body.Statements:Insert(0, CSharpLuaLuaAst.LuaExpressionStatementSyntax(invocationInit))
                        end
                    end
                end

                if #this.ctors_ == 1 then
                    AddInitFunction(this, body, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Ctor, CSharpLua.Utility.First(this.ctors_, CSharpLuaLuaAst.LuaConstructorAdapterExpressionSyntax), true)
                else
                    local ctrosTable = CSharpLuaLuaAst.LuaTableInitializerExpression()
                    local index = 1
                    for _, ctor in System.each(this.ctors_) do
                        local name = CSharpLuaLuaAst.LuaSyntaxNode.SpecailWord("ctor" --[[Tokens.Ctor]] .. index)
                        local nameIdentifier = CSharpLuaLuaAst.LuaIdentifierNameSyntax:new(1, name)
                        AddInitFunction(this, body, nameIdentifier, ctor, false)
                        ctrosTable.Items:Add(CSharpLuaLuaAst.LuaSingleTableItemSyntax(nameIdentifier))
                        index = index + 1
                    end
                    AddResultTable1(this, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Ctor, ctrosTable)
                end
            else
                if hasInit then
                    AddInitFunction(this, body, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Ctor, GetInitFunction(this), true)
                end
            end
        end
        CheckAttributes = function (this) 
            if #this.attributes_.Items > 0 then
                local functionExpression = CSharpLuaLuaAst.LuaFunctionExpressionSyntax()
                functionExpression:AddStatement(CSharpLuaLuaAst.LuaReturnStatementSyntax(this.attributes_))
                AddResultTable1(this, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Attributes, functionExpression)
            end
        end
        AddAllStatementsTo = function (this, body) 
            body.Statements:Add(this.local_)
            CheckStaticCtorFunction(this, body)
            CheckCtorsFunction(this, body)
            body.Statements:Add(this.methodList_)
            CheckAttributes(this)
            local returnStatement = CSharpLuaLuaAst.LuaReturnStatementSyntax(this.resultTable_)
            body.Statements:Add(returnStatement)
        end
        Render = function (this, renderer) 
            if this.IsPartialMark then
                return
            end

            for _, comment in System.each(this.documentComments_) do
                comment:Render(renderer)
            end

            if #this.typeParameters_ > 0 then
                local wrapFunction = CSharpLuaLuaAst.LuaFunctionExpressionSyntax()
                for _, type in System.each(this.typeParameters_) do
                    wrapFunction:AddParameter(type)
                end
                AddAllStatementsTo(this, wrapFunction.Body)
                this:getBody().Statements:Add(CSharpLuaLuaAst.LuaReturnStatementSyntax(wrapFunction))
            else
                AddAllStatementsTo(this, this:getBody())
            end
            CSharpLuaLuaAst.LuaWrapFunctionStatementSynatx.Render(this, renderer)
        end
        return {
            __inherits__ = function (global) 
                return {
                    global.CSharpLua.LuaAst.LuaWrapFunctionStatementSynatx
                }
            end, 
            IsPartialMark = false, 
            AddStaticReadOnlyAssignmentName = AddStaticReadOnlyAssignmentName, 
            AddDocumentComments = AddDocumentComments, 
            AddClassAttributes = AddClassAttributes, 
            AddMethodAttributes = AddMethodAttributes, 
            AddFieldAttributes = AddFieldAttributes, 
            AddTypeParameters = AddTypeParameters, 
            AddBaseTypes = AddBaseTypes, 
            AddMethod = AddMethod, 
            AddField = AddField, 
            AddProperty = AddProperty, 
            AddEvent = AddEvent, 
            SetStaticCtor = SetStaticCtor, 
            getIsNoneCtros = getIsNoneCtros, 
            getIsInitStatementExists = getIsInitStatementExists, 
            AddCtor = AddCtor, 
            Render = Render, 
            __ctor__ = __ctor__
        }
    end)
    namespace.class("LuaClassDeclarationSyntax", function (namespace) 
        local __ctor__
        __ctor__ = function (this, name) 
            CSharpLuaLuaAst.LuaTypeDeclarationSyntax.__ctor__(this)
            this:UpdateIdentifiers(name, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Namespace, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Class, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Namespace)
        end
        return {
            __inherits__ = function (global) 
                return {
                    global.CSharpLua.LuaAst.LuaTypeDeclarationSyntax
                }
            end, 
            __ctor__ = __ctor__
        }
    end)
    namespace.class("LuaStructDeclarationSyntax", function (namespace) 
        local __ctor__
        __ctor__ = function (this, name) 
            CSharpLuaLuaAst.LuaTypeDeclarationSyntax.__ctor__(this)
            this:UpdateIdentifiers(name, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Namespace, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Struct, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Namespace)
        end
        return {
            __inherits__ = function (global) 
                return {
                    global.CSharpLua.LuaAst.LuaTypeDeclarationSyntax
                }
            end, 
            __ctor__ = __ctor__
        }
    end)
    namespace.class("LuaInterfaceDeclarationSyntax", function (namespace) 
        local __ctor__
        __ctor__ = function (this, name) 
            CSharpLuaLuaAst.LuaTypeDeclarationSyntax.__ctor__(this)
            this:UpdateIdentifiers(name, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Namespace, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Interface, nil)
        end
        return {
            __inherits__ = function (global) 
                return {
                    global.CSharpLua.LuaAst.LuaTypeDeclarationSyntax
                }
            end, 
            __ctor__ = __ctor__
        }
    end)
    namespace.class("LuaEnumDeclarationSyntax", function (namespace) 
        local Add, Render, __ctor__
        __ctor__ = function (this, fullName, name, compilationUnit) 
            CSharpLuaLuaAst.LuaTypeDeclarationSyntax.__ctor__(this)
            this.FullName = fullName
            this.CompilationUnit = compilationUnit
            this:UpdateIdentifiers(name, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Namespace, CSharpLuaLuaAst.LuaIdentifierNameSyntax.Enum, nil)
        end
        Add = function (this, statement) 
            this.resultTable_.Items:Add(statement)
        end
        Render = function (this, renderer) 
            if this.IsExport then
                CSharpLuaLuaAst.LuaTypeDeclarationSyntax.Render(this, renderer)
            end
        end
        return {
            __inherits__ = function (global) 
                return {
                    global.CSharpLua.LuaAst.LuaTypeDeclarationSyntax
                }
            end, 
            IsExport = false, 
            Add = Add, 
            Render = Render, 
            __ctor__ = __ctor__
        }
    end)
end)
