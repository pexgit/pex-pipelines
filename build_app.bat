cd source-code-repository

nuget locals all -clear

nuget restore PexSampleAspNet/packages.config -PackagesDirectory packages

"C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\MSBuild\Current\Bin\MSBuild.exe" PexSampleAspNet/PexSampleAspNet.csproj ^
  /t:Clean;Build;Package ^
  /p:TargetFrameworkVersion=v4.7 ^
        /p:OutputPath="./bin/Release" ^
        /p:Configuration=$configuration ^
        /p:Platform=AnyCPU ^
        /p:PublishDirectory="./bin/Release/publish" ^
        /p:PublishProfile=folderprofile
        
dir .\PexSampleAspNet\bin\Release

xcopy "./PexSampleAspNet/bin/Release" "../publish-directory" /O /X /E /H /K /Q /Y
