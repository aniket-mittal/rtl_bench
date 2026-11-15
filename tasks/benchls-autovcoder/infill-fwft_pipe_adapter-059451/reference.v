module autovcoder_059451 #(
    parameter C_DWIDTH     = 1,  //  Allowed values: 1+
    parameter C_INV_EXISTS = 0   //  Allowed values: 0,1
) (
    // system signals
    input  wire                Clk,
    input  wire                Rst,
    // FIFO side signals
    input  wire                FIFO_Exists,  // Exists or Empty
    output wire                FIFO_Read,    // Read is Pop
    input  wire [C_DWIDTH-1:0] FIFO_Data,
    // Pipelined signals
    output wire                PIPE_Exists,
    input  wire                PIPE_Read,
    output reg  [C_DWIDTH-1:0] PIPE_Data
);

  wire fifo_exists_i;
  reg  fifo_exists_d1;
  wire fifo_exists_rising_edge;
  wire fifo_read_cond_1;
  wire fifo_read_cond_2;
  reg  pipe_exists_i;

  // Exists is really an empty signal in this case
  generate
    if (C_INV_EXISTS) begin : FIFO_EMPTY
      assign fifo_exists_i = ~FIFO_Exists;
      assign PIPE_Exists   = ~pipe_exists_i;
    end else begin : FIFO_EXISTS
      assign fifo_exists_i = FIFO_Exists;
      assign PIPE_Exists   = pipe_exists_i;
    end
  endgenerate

  // Exists signal is a S/R latch w/ rst
  always @(posedge Clk)
    if (Rst) pipe_exists_i <= 1'b0;
    else pipe_exists_i <= fifo_exists_i | (~PIPE_Read & pipe_exists_i);

  // Rising edge detector for FIFO_Exists
  always @(posedge Clk) fifo_exists_d1 <= fifo_exists_i;

  assign fifo_exists_rising_edge = fifo_exists_i & ~fifo_exists_d1;

  // Condition 1 to Read the FIFO our pipe is empty and the fifo is not
  assign fifo_read_cond_1 = ~pipe_exists_i & fifo_exists_rising_edge;

  // condition 2 to read the FIFO is if a READ is issued and we have more data
  // in the fifo
  assign fifo_read_cond_2 = PIPE_Read & fifo_exists_i;

  // Or the two conditions
  assign FIFO_Read = fifo_read_cond_1 | fifo_read_cond_2;

  // Data pipeline register, we advance every time a read is performed
  always @(posedge Clk) if (FIFO_Read) PIPE_Data <= FIFO_Data;



endmodule

