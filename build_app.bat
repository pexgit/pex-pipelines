cd source-code-repository
nuget restore PexSampleAspNet/packages.config -PackagesDirectory packages
C:\windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe PexSampleAspNet/PexSampleAspNet.csproj ^
  /p:RoslynToolPath="packages\Microsoft.CodeDom.Providers.DotNetCompilerPlatform.2.0.1\build\net46\Microsoft.CodeDom.Providers.DotNetCompilerPlatform.props" ^
  /p:TargetFrameworkVersion=v4.7 ^
        /t:"clean;build;publish" ^
        /p:OutputPath="./bin/Release" ^
        /p:Configuration=$configuration ^
        /p:Platform=AnyCPU ^
        /p:DeployOnBuild=true ^
        /p:PublishDirectory="./bin/Release/Publish" ^
        /p:PublishProfile=folderprofile
