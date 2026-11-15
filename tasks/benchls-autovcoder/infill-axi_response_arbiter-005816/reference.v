module autovcoder_005816 #(
    parameter NUM = 3
)  // num of slaves
(
      input  wire         ARESETn
    , input  wire         ACLK
    //-----------------------------------------------------------
    , input  wire [NUM:0] BSELECT  // selected by comparing trans_id
    , input  wire [NUM:0] BVALID
    , input  wire [NUM:0] BREADY
    , output wire [NUM:0] BGRANT
    //-----------------------------------------------------------
    , input  wire [NUM:0] RSELECT  // selected by comparing trans_id
    , input  wire [NUM:0] RVALID
    , input  wire [NUM:0] RREADY
    , input  wire [NUM:0] RLAST
    , output wire [NUM:0] RGRANT
);
  //-----------------------------------------------------------
  // read-data arbiter
  //-----------------------------------------------------------
  reg [NUM:0] rgrant_reg;
  //-----------------------------------------------------------
  localparam STR_RUN = 'h0, STR_WAIT = 'h1;
  reg stateR = STR_RUN;
  always @(posedge ACLK or negedge ARESETn) begin
    if (ARESETn == 1'b0) begin
      rgrant_reg <= 'h0;
      stateR     <= STR_RUN;
    end else begin
      case (stateR)
        STR_RUN: begin
          if (|RGRANT) begin
            if (~|(RGRANT & RREADY & RLAST)) begin
              rgrant_reg <= RGRANT;
              stateR     <= STR_WAIT;
            end
          end
        end  // STR_RUN
        STR_WAIT: begin
          if (|(RGRANT & RVALID & RREADY & RLAST)) begin
            rgrant_reg <= 'h0;
            stateR     <= STR_RUN;
          end
        end  // STR_WAIT
      endcase
    end
  end
  //-----------------------------------------------------------
  assign RGRANT = (stateR == STR_RUN) ? priority_sel(RSELECT & RVALID) : rgrant_reg;
  //-----------------------------------------------------------
  // write-response arbiter
  //-----------------------------------------------------------
  reg [NUM:0] bgrant_reg;
  localparam STB_RUN = 'h0, STB_WAIT = 'h1;
  reg stateB = STB_RUN;
  always @(posedge ACLK or negedge ARESETn) begin
    if (ARESETn == 1'b0) begin
      bgrant_reg <= 'h0;
      stateB     <= STB_RUN;
    end else begin
      case (stateB)
        STB_RUN: begin
          if (|BGRANT) begin
            if (~|(BGRANT & BREADY)) begin
              bgrant_reg <= BGRANT;
              stateB     <= STB_WAIT;
            end
          end
        end  // STB_RUN
        STB_WAIT: begin
          if (|(BGRANT & BVALID & BREADY)) begin
            bgrant_reg <= 'h0;
            stateB     <= STB_RUN;
          end
        end  // STB_WAIT
      endcase
    end
  end
  //-----------------------------------------------------------
  assign BGRANT = (stateB == STB_RUN) ? priority_sel(BSELECT & BVALID) : bgrant_reg;
  //-----------------------------------------------------------
  function [NUM:0] priority_sel;
    input [NUM:0] request;
    begin
      casex (request)
        4'bxxx1: priority_sel = 4'h1;
        4'bxx10: priority_sel = 4'h2;
        4'bx100: priority_sel = 4'h4;
        4'b1000: priority_sel = 4'h8;
        default: priority_sel = 4'h0;
      endcase
    end
  endfunction
  //-----------------------------------------------------------
endmodule

