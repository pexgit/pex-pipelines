cd source-code-repository
nuget restore PexSampleAspNet/packages.config -PackagesDirectory packages
dotnet add package RoslynCodeTaskFactory
dotnet msbuild PexSampleAspNet/PexSampleAspNet.csproj ^
  /p:TargetFrameworkVersion=v4.7 ^
        /t:"clean;build;publish" ^
        /p:OutputPath="./bin/Release" ^
        /p:Configuration=$configuration ^
        /p:Platform=AnyCPU ^
        /p:DeployOnBuild=true ^
        /p:PublishDirectory="./bin/Release/Publish" ^
        /p:PublishProfile=folderprofile
