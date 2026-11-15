module autovcoder_080734 (
    input wire iCLOCK,
    input wire inRESET,
    input wire iRESET_SYNC,
    //
    input wire iCMD_START,
    output wire oCMD_END,
    //Write
    output wire oMMC_REQ,
    input wire iMMC_BUSY,
    output wire oMMC_CS,
    output wire [7:0] oMMC_DATA,
    //Read
    input wire iMMC_VALID,
    input wire [7:0] iMMC_DATA
);

  localparam PL_MAIN_STT_IDLE = 3'h0;
  localparam PL_MAIN_STT_CMD = 3'h1;
  localparam PL_MAIN_STT_RESP_REQ = 3'h2;
  localparam PL_MAIN_STT_RESP_GET = 3'h3;
  localparam PL_MAIN_STT_END = 3'h4;

  function [7:0] func_cmd_flame;
    input [2:0] func_select;
    begin
      case (func_select)
        3'h0: func_cmd_flame = 8'h41;
        3'h1: func_cmd_flame = 8'h00;
        3'h2: func_cmd_flame = 8'h00;
        3'h3: func_cmd_flame = 8'h00;
        3'h4: func_cmd_flame = 8'h00;
        3'h5: func_cmd_flame = 8'h95;
        default: func_cmd_flame = 8'h00;
      endcase
    end
  endfunction

  reg [2:0] b_main_state;
  reg [2:0] b_main_count;


  [MASKED]

  assign oCMD_END = (b_main_state == PL_MAIN_STT_END);
  assign oMMC_REQ = !iMMC_BUSY && (b_main_state == PL_MAIN_STT_CMD || b_main_state == PL_MAIN_STT_RESP_REQ);
  assign oMMC_CS = (b_main_state == PL_MAIN_STT_IDLE || b_main_state == PL_MAIN_STT_END)? 1'b1 : 1'b0;
  assign oMMC_DATA = (b_main_state == PL_MAIN_STT_CMD) ? func_cmd_flame(b_main_count) : 8'hff;



endmodule

