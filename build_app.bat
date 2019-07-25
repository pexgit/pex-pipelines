cd source-code-repository

nuget locals all -clear

nuget restore PexSampleAspNet/packages.config -PackagesDirectory packages

MSBuild PexSampleAspNet/PexSampleAspNet.csproj ^
  /t:Clean;Build;Publish ^
  /p:TargetFrameworkVersion=v4.7 ^
        /p:OutputPath="./bin/Release" ^
        /p:Configuration=$configuration ^
        /p:Platform=AnyCPU ^
        /p:PublishDirectory="./bin/Release/publish" ^
        /p:PublishProfile=folderprofile ^
        /p:DeployOnBuild=true
        
dir .\PexSampleAspNet\bin\Release

xcopy "./PexSampleAspNet/bin/Release" "../publish-directory" /O /X /E /H /K /Q /Y
