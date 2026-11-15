module ad463x_data_capture #(
  parameter DDR_EN = 0,
  parameter NUM_OF_LANES = 2,
  parameter DATA_WIDTH = 32
) (
  input                                     clk,          // core clock of the SPIE
  input                                     csn,          // CSN (chip select)
  input                                     echo_sclk,    // BUSY/SCLKOUT
  input [NUM_OF_LANES-1:0]                  data_in,      // serial data lines

  output [(NUM_OF_LANES * DATA_WIDTH)-1:0]  m_axis_data,  // parallel data lines
  output                                    m_axis_valid, // data validation
  input                                     m_axis_ready  // NOTE: back pressure is ignored
);

  reg csn_d;

  wire reset;

  always @(posedge clk) begin
    csn_d <= csn;
  end

  // negative edge resets the shift registers
  assign reset = ~csn & csn_d;

  // CSN positive edge validates the output data
  // WARNING: there isn't any buffering for data, if the sink module is not
  // ready, the data will be discarded
  assign m_axis_valid = csn & ~csn_d & m_axis_ready;

  genvar i, j;
  generate
  if (DDR_EN) // Double Data Rate mode
  begin

    for (i=0; i<NUM_OF_LANES; i=i+1) begin

      reg [DATA_WIDTH-1:0] data_shift_p;
      reg [DATA_WIDTH-1:0] data_shift_n;

      // shift register for positive edge
      always @(negedge echo_sclk or posedge reset) begin
        if (reset) begin
          data_shift_n <= 0;
        end else begin
          data_shift_n <= {data_shift_n, data_in[i]};
        end
      end

      // shift register for positive edge
      always @(posedge echo_sclk or posedge reset) begin
        if (reset) begin
          data_shift_p <= 0;
        end else begin
          data_shift_p <= {data_shift_p, data_in[i]};
        end
      end

      // DDR output logic - only the first 16 bits are forwarded
      for (j=0; j<DATA_WIDTH/2; j=j+1) begin
        assign m_axis_data[DATA_WIDTH*i+(j*2)+:2] = {data_shift_p[j], data_shift_n[j]};
      end

    end /* for loop */

  end else begin  // Single Data Rate mode

    for (i=0; i<NUM_OF_LANES; i=i+1) begin

      reg [DATA_WIDTH-1:0] data_shift_n;

      // shift register for positive edge
      always @(negedge echo_sclk or posedge reset) begin
        if (reset) begin
          data_shift_n <= 0;
        end else begin
          data_shift_n <= {data_shift_n, data_in[i]};
        end
      end

      // SDR output logic
      assign m_axis_data[DATA_WIDTH*i+:DATA_WIDTH] = data_shift_n;

    end /* for loop */

  end
  endgenerate

endmodule