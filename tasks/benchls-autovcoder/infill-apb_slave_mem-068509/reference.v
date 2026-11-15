module autovcoder_068509 (
    apb_clk,
    apb_reset,
    apb_addr,
    apb_write,
    apb_en,
    apb_wdata,
    apb_rdata,
    apb_selx,
    apb_ready,
    apb_slverr,
    wait_cycle
);

  //INPUT/OUTPUT PORT DECLARATION

  input apb_clk;
  input apb_reset;
  input [7:0] apb_addr;
  input [31:0] apb_wdata;
  input apb_en;
  output [31:0] apb_rdata;
  output apb_ready;
  output apb_slverr;
  input apb_selx;
  input apb_write;
  input [31:0] wait_cycle;

  //SIGNAL DECLARATION

  reg [31:0] apb_rdata = 1'b0;
  reg [1:0] present_state;
  reg [1:0] next_state;
  reg [31:0] mem[31:0];
  reg apb_ready;
  reg apb_slverr;

  //CONSTANT PARAMETER DECLARATION FOR STATE TRANSITION

  parameter [1:0] IDLE = 2'b00;
  parameter [1:0] SETUP = 2'b01;
  parameter [1:0] ACCESS = 2'b10;

  // INTERNAL REGISTERS

  reg [31:0] l_cnt;

  initial begin

    l_cnt = 0;
  end

  //PROCEDURAL BLOCK FOR SEQUENTIAL LOGIC

  always @(posedge apb_clk) begin
    if (apb_reset) present_state <= IDLE;
    else present_state <= next_state;

    if ((present_state == IDLE) && (apb_selx == 1)) begin
      l_cnt <= l_cnt + 1;
    end else begin
      l_cnt <= 0;
    end
  end

  //PROCEDURAL BLOCK FOR COMBINATIONAL LOGIC FOR STATE TRANSITION

  always @(*) begin
    case (present_state)
      IDLE: begin
        if ((apb_selx == 1) && (l_cnt >= wait_cycle)) begin
          next_state = SETUP;
        end else begin
          next_state = IDLE;
        end

        apb_ready  = 0;
        apb_slverr = 0;

      end
      SETUP: begin
        apb_ready  = 0;
        apb_slverr = 0;
        next_state = ACCESS;

        if (apb_selx == 0) begin
          next_state = IDLE;
        end
      end
      ACCESS: begin
        if ((apb_selx == 1) && (apb_en == 1)) begin
          next_state = IDLE;
        end else if ((apb_selx == 1) && (apb_en == 0)) begin
          next_state = ACCESS;
        end else begin
          next_state = IDLE;
        end

        apb_ready = 1;
        if ((apb_selx == 1) && (apb_en == 1)) begin
          if (apb_addr > 31) begin
            apb_slverr = 1;
          end else if (apb_write == 0) begin
            apb_rdata = mem[apb_addr];
          end else if (apb_write == 1) begin
            mem[apb_addr] = apb_wdata;
          end else begin
            apb_slverr = 1;
          end
        end
      end
      default: begin
        next_state = IDLE;
      end

    endcase
  end
endmodule

