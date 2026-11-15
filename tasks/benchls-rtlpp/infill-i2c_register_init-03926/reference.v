module rtlpp_03926(
  input  wire Clk,
  input  wire Reset_n,
  output wire SDA,
  output wire SCL,
  output reg Done
);

parameter C_I2C_SLAVE_ADDR = 7'h76;
parameter CLK_RATE_MHZ = 100;
parameter SCK_PERIOD_US = 30;
parameter TRANSITION_CYCLE = (CLK_RATE_MHZ * SCK_PERIOD_US) / 2;
parameter TRANSITION_CYCLE_MSB = 12;

localparam IDLE = 3'd0,
           INIT = 3'd1,
           START = 3'd2,
           CLK_FALL = 3'd3,
           SETUP = 3'd4,
           CLK_RISE = 3'd5,
           WAIT = 3'd6;
           
localparam START_BIT = 1'b1,
           ACK = 1'b1,
           WRITE = 1'b0,
           STOP_BIT = 1'b0;
           
localparam REG_ADDR0 = 8'h49,
           REG_ADDR1 = 8'h21,
           REG_ADDR2 = 8'h33,
           REG_ADDR3 = 8'h34,
           REG_ADDR4 = 8'h36,
           REG_ADDR5 = 8'h48,
           DATA0 = 8'hC0,	
           DATA1 = 8'h09,	
           DATA2a = 8'h06,	
           DATA2b = 8'h08,
           DATA3a = 8'h26,
           DATA3b = 8'h16,
           DATA4a = 8'hA0,
           DATA4b = 8'h60,
           DATA5 = 8'h00,
           SDA_BUFFER_MSB = 27;

wire [6:0] SLAVE_ADDR = C_I2C_SLAVE_ADDR;
reg SDA_out;
reg SCL_out;  
reg [TRANSITION_CYCLE_MSB:0] cycle_count;
reg [2:0] c_state;
reg [2:0] n_state;
reg [2:0] write_count;
reg [31:0] bit_count;
reg [SDA_BUFFER_MSB:0] SDA_BUFFER;
wire transition;

always @(posedge Clk) begin
  if (~Reset_n || c_state == IDLE) begin
    SDA_out <= 1'b1;
    SCL_out <= 1'b1;
  end else if (c_state == INIT && transition) begin
    SDA_out <= 1'b0;
  end else if (c_state == SETUP) begin
    SDA_out <= SDA_BUFFER[SDA_BUFFER_MSB];
  end else if (c_state == CLK_RISE && cycle_count == TRANSITION_CYCLE / 2 && bit_count == SDA_BUFFER_MSB) begin
    SDA_out <= 1'b1;
  end else if (c_state == CLK_FALL) begin
    SCL_out <= 1'b0;
  end else if (c_state == CLK_RISE) begin
    SCL_out <= 1'b1;
  end
end

assign SDA = SDA_out;
assign SCL = SCL_out;

always @(posedge Clk) begin
  if (~Reset_n) begin
    SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR0, ACK, DATA0, ACK, STOP_BIT};
    cycle_count <= 0;
  end else if (c_state == SETUP && cycle_count == TRANSITION_CYCLE) begin
    SDA_BUFFER <= {SDA_BUFFER[SDA_BUFFER_MSB-1:0], 1'b0};
    cycle_count <= 0;
  end else if (cycle_count == TRANSITION_CYCLE) begin
    cycle_count <= 0;
  end else if (c_state == WAIT) begin
    case (write_count)
      3'd0: SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR1, ACK, DATA1, ACK, STOP_BIT};
      3'd1: SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR2, ACK, DATA2b, ACK, STOP_BIT};
      3'd2: SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR3, ACK, DATA3b, ACK, STOP_BIT};
      3'd3: SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR4, ACK, DATA4b, ACK, STOP_BIT};
      3'd4: SDA_BUFFER <= {SLAVE_ADDR, WRITE, ACK, REG_ADDR5, ACK, DATA5, ACK, STOP_BIT};
      default: SDA_BUFFER <= 28'dx;
    endcase
    cycle_count <= cycle_count + 1;
  end else begin
    cycle_count <= cycle_count + 1;
  end
end

always @(posedge Clk) begin
  if (~Reset_n) begin
    write_count <= 3'd0;
  end else if (c_state == WAIT && cycle_count == TRANSITION_CYCLE) begin
    write_count <= write_count + 1;
  end
end

always @(posedge Clk) begin
  if (~Reset_n) begin
    Done <= 1'b0;
  end else if (c_state == IDLE) begin
    Done <= 1'b1;
  end
end

always @(posedge Clk) begin
  if (~Reset_n || (c_state == WAIT)) begin
    bit_count <= 0;
  end else if (c_state == CLK_RISE && cycle_count == TRANSITION_CYCLE) begin
    bit_count <= bit_count + 1;
  end
end

always @(posedge Clk) begin
  if (~Reset_n) begin
    c_state <= INIT;
  end else begin
    c_state <= n_state;
  end
end

assign transition = (cycle_count == TRANSITION_CYCLE);

always @* begin
  case (c_state)
    IDLE: begin
      if (~Reset_n) n_state = INIT;
      else n_state = IDLE;
    end
    INIT: begin
      if (transition) n_state = START;
      else n_state = INIT;
    end
    START: begin
      if (transition) n_state = CLK_FALL;
      else n_state = START;
    end
    CLK_FALL: begin
      if (transition) n_state = SETUP;
      else n_state = CLK_FALL;
    end
    SETUP: begin
      if (transition) n_state = CLK_RISE;
      else n_state = SETUP;
    end
    CLK_RISE: begin
      if (transition && bit_count == SDA_BUFFER_MSB) n_state = WAIT;
      else if (transition) n_state = CLK_FALL;
      else n_state = CLK_RISE;
    end
    WAIT: begin
      if (transition && write_count != 3'd4) n_state = INIT;
      else if (transition) n_state = IDLE;
      else n_state = WAIT;
    end
    default: n_state = IDLE;
  endcase
end

endmodule