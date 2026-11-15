module autovcoder_095291 (
    BoardSignals_Clock,
    BoardSignals_Reset,
    BoardSignals_Running,
    BoardSignals_Starting,
    BoardSignals_Started,
    CurrentState,
    NextState,
    Waiting_NextState,
    Waiting_IsIn,
    Dispatching_NextState,
    Dispatching_IsIn,
    Dispatching_To_Waiting
);
  // Has 2 states
  localparam Waiting = 2'b00;
  localparam Dispatching = 2'b01;
  input wire BoardSignals_Clock;
  input wire BoardSignals_Reset;
  input wire BoardSignals_Running;
  input wire BoardSignals_Starting;
  input wire BoardSignals_Started;
  input wire [2:1] CurrentState;
  output wire [2:1] NextState;
  input wire [2:1] Waiting_NextState;
  output wire Waiting_IsIn;
  input wire [2:1] Dispatching_NextState;
  output wire Dispatching_IsIn;
  output wire Dispatching_To_Waiting;
  // IsInState
  assign Waiting_IsIn = CurrentState == Waiting ? BoardSignals_Running : 1'b0;
  assign Dispatching_IsIn = CurrentState == Dispatching ? BoardSignals_Running : 1'b0;
  // NextState
  reg [2:1] localNextState = 2'b00;
  always @* begin
    case (CurrentState)
      Waiting: localNextState = Waiting_NextState;
      Dispatching: localNextState = Dispatching_NextState;
      default: localNextState = Waiting;
    endcase
  end
  assign NextState = localNextState;
  // FromState
  // TransitionsState
  assign Dispatching_To_Waiting = CurrentState == Dispatching && NextState == Waiting ? BoardSignals_Running : 1'b0;
endmodule

