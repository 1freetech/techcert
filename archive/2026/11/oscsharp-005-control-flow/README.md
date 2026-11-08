# OSC#.005: Control Flow — Conditions, Switch and Loops

Requires the .NET 10 SDK. All values are fictional educational inputs, not telemetry.

1. Download `ControlFlowLab.csproj` and `Program.cs` in the same directory.
2. Verify the SDK: `dotnet --version`
3. Compile: `dotnet build ControlFlowLab.csproj`
4. Run: `dotnet run --project ControlFlowLab.csproj`
5. Run 32 runtime assertions: `dotnet run --project ControlFlowLab.csproj -- --test`

Expected sample summary (once built and executed):
```
Accepted before stop: 3
Skipped before stop: 1
Sum before stop: 197 W (illustrative)
First alert index: 3
Polling attempts: 2
Do-while count for limit 0: 1
```
Expected test result: `PASS: 32 C# checks`.

**QA status at authoring:** locally checked source structure and deterministic sample arithmetic. No `dotnet` SDK was installed in the authoring runtime; project compilation and 32 C# runtime assertions were NOT executed. Run on a machine with the .NET 10 SDK to verify. No external dependencies, network operations, or device controls.
