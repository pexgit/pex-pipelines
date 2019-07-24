cd source-code-repository

nuget locals all -clear
nuget restore PexSampleAspNet/packages.config -PackagesDirectory packages

dotnet msbuild PexSampleAspNet/PexSampleAspNet.csproj ^
  /t:"clean;build;publish" ^
  /p:RoslynToolPath="packages\Microsoft.CodeDom.Providers.DotNetCompilerPlatform.2.0.1\build\net46\Microsoft.CodeDom.Providers.DotNetCompilerPlatform.props" ^
  /p:TargetFrameworkVersion=v4.7 ^
        /p:OutputPath="./bin/Release" ^
        /p:Configuration=$configuration ^
        /p:Platform=AnyCPU ^
        /p:DeployOnBuild=true ^
        /p:PublishDirectory="./bin/Release/publish" ^
        /p:PublishProfile=folderprofile
        
dir .\PexSampleAspNet

xcopy "./PexSampleAspNet/bin/Release" "../publish-directory" /O /X /E /H /K /Q 
xcopy "./PexSampleAspNet" "../publish-directory" /O /X /E /H /K /Q /EXCLUDE:App_Start bin Controllers Global.asax.cs manifest.yml obj *.config *.csproj *.csproj.user
copy "PexSampleAspNet\Web.config" "../publish-directory/Web*.config"
