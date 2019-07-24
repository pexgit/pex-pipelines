cd source-code-repository

nuget locals all -clear
nuget restore PexSampleAspNet/packages.config -PackagesDirectory packages

dotnet msbuild PexSampleAspNet/PexSampleAspNet.csproj ^
  /p:RoslynToolPath="packages\Microsoft.CodeDom.Providers.DotNetCompilerPlatform.2.0.1\build\net46\Microsoft.CodeDom.Providers.DotNetCompilerPlatform.props" ^
  /p:TargetFrameworkVersion=v4.7 ^
        /t:"clean;build;publish" ^
        /p:OutputPath="./bin/Release" ^
        /p:Configuration=$configuration ^
        /p:Platform=AnyCPU ^
        /p:DeployOnBuild=true ^
        /p:PublishDirectory="../publish-directory" ^
        /p:PublishProfile=folderprofile
 
REM The publish directory is empty, and the contents of the bin/Release directory are missing the web.config
dir PexSampleAspNet/bin
xcopy "PexSampleAspNet/bin/Release" "../publish-directory" /O /X /E /H /K
