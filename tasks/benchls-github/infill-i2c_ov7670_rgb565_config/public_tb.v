// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  I2C_OV7670_RGB565_Config dut (
    .LUT_INDEX(in_vec[7:0]),
    .LUT_DATA(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h72;
    stim[1] = 8'h63;
    stim[2] = 8'h69;
    stim[3] = 8'hb4;
    stim[4] = 8'h9b;
    stim[5] = 8'h49;
    stim[6] = 8'h72;
    stim[7] = 8'h90;
    stim[8] = 8'hc0;
    stim[9] = 8'hd3;
    stim[10] = 8'h07;
    stim[11] = 8'hef;
    stim[12] = 8'he5;
    stim[13] = 8'h1f;
    stim[14] = 8'h31;
    stim[15] = 8'hd8;
    stim[16] = 8'h78;
    stim[17] = 8'h6a;
    stim[18] = 8'hee;
    stim[19] = 8'hd9;
    stim[20] = 8'h35;
    stim[21] = 8'h04;
    stim[22] = 8'h0e;
    stim[23] = 8'h4f;
    stim[24] = 8'h81;
    stim[25] = 8'hbf;
    stim[26] = 8'h9b;
    stim[27] = 8'h27;
    stim[28] = 8'hec;
    stim[29] = 8'ha8;
    stim[30] = 8'hb5;
    stim[31] = 8'hac;
    stim[32] = 8'h59;
    stim[33] = 8'h87;
    stim[34] = 8'h25;
    stim[35] = 8'hdc;
    stim[36] = 8'h0b;
    stim[37] = 8'h0f;
    stim[38] = 8'h7f;
    stim[39] = 8'h7c;
    stim[40] = 8'hcc;
    stim[41] = 8'he2;
    stim[42] = 8'ha0;
    stim[43] = 8'hbf;
    stim[44] = 8'h69;
    stim[45] = 8'h53;
    stim[46] = 8'h69;
    stim[47] = 8'h7e;
    stim[48] = 8'hd5;
    stim[49] = 8'he0;
    stim[50] = 8'h14;
    stim[51] = 8'hc7;
    stim[52] = 8'hea;
    stim[53] = 8'h79;
    stim[54] = 8'h52;
    stim[55] = 8'he4;
    stim[56] = 8'h0f;
    stim[57] = 8'hca;
    stim[58] = 8'h5b;
    stim[59] = 8'h4b;
    stim[60] = 8'h24;
    stim[61] = 8'h6c;
    stim[62] = 8'hd2;
    stim[63] = 8'h98;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 16'h5100;
      expv[1] = 16'h6520;
      expv[2] = 16'h6e11;
      expv[3] = 16'h0000;
      expv[4] = 16'hc820;
      expv[5] = 16'h8d4f;
      expv[6] = 16'h5100;
      expv[7] = 16'h790f;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h6b00;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h838f;
      expv[14] = 16'ha068;
      expv[15] = 16'h0000;
      expv[16] = 16'h3f00;
      expv[17] = 16'h6f9f;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'ha8f0;
      expv[21] = 16'h3a04;
      expv[22] = 16'h0c00;
      expv[23] = 16'h9600;
      expv[24] = 16'h3411;
      expv[25] = 16'h0000;
      expv[26] = 16'hc820;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h4658;
      expv[33] = 16'h9930;
      expv[34] = 16'h89e8;
      expv[35] = 16'h0000;
      expv[36] = 16'h1902;
      expv[37] = 16'h3e00;
      expv[38] = 16'h4138;
      expv[39] = 16'h7701;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h7903;
      expv[43] = 16'h0000;
      expv[44] = 16'h6e11;
      expv[45] = 16'hb20e;
      expv[46] = 16'h6e11;
      expv[47] = 16'hc9f0;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'ha202;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h7505;
      expv[54] = 16'hb10c;
      expv[55] = 16'h0000;
      expv[56] = 16'h3e00;
      expv[57] = 16'h0000;
      expv[58] = 16'h483a;
      expv[59] = 16'h8f00;
      expv[60] = 16'h88d7;
      expv[61] = 16'h0140;
      expv[62] = 16'h0000;
      expv[63] = 16'h790c;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
