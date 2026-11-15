module autovcoder_002746 (
    input CCLK,
    input rst,
    input ready,
    input frame_done,
    input [19:0] leftadc,
    input [19:0] rightadc,
    input [19:0] reg_status,
    input [19:0] status_data,
    output reg cmd_vd,
    output reg left_vd,
    output reg right_vd,
    output reg [19:0] leftdac,
    output reg [19:0] rightdac,
    output reg [7:0] cmd_addr,
    output reg [15:0] cmd_data
);

  reg set;
  reg [4:0] state;
  //reg rst = 0;


  always @(posedge CCLK) begin
    if (rst) begin
      //reset registers
      state = 0;
      cmd_vd = 0;
      left_vd = 0;
      right_vd = 0;
      leftdac = 0;
      rightdac = 0;
      cmd_addr = 0;
      cmd_data = 0;
      set = 0;
      //rst = 1;
    end else begin
      case (state)
        0: begin  //Init State
          //Check codec status after reset or power-on
          if (ready) begin
            cmd_addr = 8'h80 + 8'h26;  //read + addr
            cmd_vd   = 1;
            if (status_data[7:4] == 4'hF)  //status = ready
              state = 1;
          end else state = 0;
        end
        1: begin  //master volume
          if (ready) begin
            cmd_addr = 8'h02;
            cmd_data = 16'h0000;
            set = 1;
          end else state = 1;
          if (frame_done && set) begin
            state = 2;
            set   = 0;
          end
        end
        2: begin  //Line-in gain
          if (ready) begin
            cmd_addr = 8'h10;
            cmd_data = 16'h0000;
            set = 1;
          end else state = 2;
          if (frame_done && set) begin
            state = 3;
            set   = 0;
          end
        end
        3: begin  //Record Select
          if (ready) begin
            cmd_addr = 8'h1A;
            cmd_data = 16'h0404;
            set = 1;
          end else state = 3;
          if (frame_done && set) begin
            state = 4;
            set   = 0;
          end
        end
        4: begin  //Record gain
          if (ready) begin
            cmd_addr = 8'h1C;
            cmd_data = 16'h0000;
            set = 1;
          end else state = 4;
          if (frame_done && set) begin
            state = 5;
            set   = 0;
          end
        end
        5: begin  //Send ADC input data directly to DAC
          if (ready) begin
            cmd_addr = 8'h80;
            cmd_vd = 0;
            leftdac = leftadc;
            rightdac = rightadc;
            left_vd = 1;
            right_vd = 1;
            set = 1;
          end

          if (frame_done && set) begin
            set = 0;
          end
        end
      endcase
    end
  end


endmodule

