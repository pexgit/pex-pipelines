cd source-code-repository

nuget locals all -clear

nuget restore PexSampleAspNet/packages.config -PackagesDirectory packages
        
dotnet publish PexSampleAspNet/PexSampleAspNet.csproj -c Release -f net472 -o "./PexSampleAspNet/publish" -r win-x64
        
dir .\PexSampleAspNet\publish

xcopy "./PexSampleAspNet/publish" "../publish-directory" /O /X /E /H /K /Q /Y
