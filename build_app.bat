cd source-code-repository

nuget locals all -clear
nuget restore PexSampleAspNet/packages.config -PackagesDirectory packages

dotnet msbuild PexSampleAspNet/PexSampleAspNet.csproj ^
  -t:publish ^
  -p:RoslynToolPath="packages\Microsoft.CodeDom.Providers.DotNetCompilerPlatform.2.0.1\build\net46\Microsoft.CodeDom.Providers.DotNetCompilerPlatform.props" ^
  -p:TargetFrameworkVersion=v4.7 ^
        -t:clean ^
        -t:build ^
        -p:OutputPath="./bin/Release" ^
        -p:Configuration=$configuration ^
        -p:Platform=AnyCPU ^
        -p:DeployOnBuild=true ^
        -p:PublishDirectory="./bin/Release/publish" ^
        -p:PublishProfile=folderprofile

dir ./PexSampleAspNet/bin/Release/publish

REM Changed the OutputPath from bin/Release to bin
REM The publish directory is empty, and the contents of the bin directory are missing the web.config
REM xcopy "PexSampleAspNet/bin/Release/publish" "../publish-directory" /O /X /E /H /K
