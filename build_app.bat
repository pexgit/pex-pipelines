cd source-code-repository

nuget locals all -clear

"C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\MSBuild\Current\Bin\MSBuild.exe" PexSampleAspNet/PexSampleAspNet.csproj ^
  /t:"clean;build;publish" ^
  /p:TargetFrameworkVersion=v4.7 ^
        /p:OutputPath="./bin/Release" ^
        /p:Configuration=$configuration ^
        /p:Platform=AnyCPU ^
        /p:DeployOnBuild=true ^
        /p:PublishDirectory="./bin/Release/publish" ^
        /p:PublishProfile=folderprofile
        
dir .\PexSampleAspNet\bin\Release\publish

xcopy "./PexSampleAspNet/bin/Release/publish" "../publish-directory" /O /X /E /H /K /Q /Y
