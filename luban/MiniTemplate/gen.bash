#!/bin/bash
set -o pipefail

# 执行 dotnet 命令生成代码和数据
dotnet "../Tools/Luban/Luban.dll" \
    --conf "./gen.conf" \
    -t all \
    -c cs-bin \
    -x cs-bin.outputCodeDir=../../output/code/cs \
    -d bin \
    -x bin.outputDataDir=../../output/data/bin \
    -x namingConvention.cs-bin.namespace=pascal \
    -x namingConvention.cs-bin.type=pascal \
    -x namingConvention.cs-bin.method=pascal \
    -x namingConvention.cs-bin.property=pascal \
    -x namingConvention.cs-bin.field=camel \
    -x namingConvention.cs-bin.enumItem=pascal \
    -c java-json \
    -x java-json.outputCodeDir=../../output/code/java \
    -d json \
    -x json.outputDataDir=../../output/data/json \
    -x namingConvention.java-json.namespace=camel \
    -x namingConvention.java-json.type=pascal \
    -x namingConvention.java-json.method=camel \
    -x namingConvention.java-json.property=camel \
    -x namingConvention.java-json.field=camel \
    -x namingConvention.java-json.enumItem=pascal \
