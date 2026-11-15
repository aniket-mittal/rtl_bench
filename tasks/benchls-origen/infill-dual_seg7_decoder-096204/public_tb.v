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

  origen_096204 dut (
    .LEDt(in_vec[7:4]),
    .LEDc(in_vec[3:0]),
    .ledst(out_vec[15:8]),
    .ledsc(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'ha9;
    stim[1] = 8'h16;
    stim[2] = 8'hed;
    stim[3] = 8'h13;
    stim[4] = 8'ha6;
    stim[5] = 8'he7;
    stim[6] = 8'hf5;
    stim[7] = 8'h96;
    stim[8] = 8'he0;
    stim[9] = 8'h88;
    stim[10] = 8'h8c;
    stim[11] = 8'h7b;
    stim[12] = 8'h80;
    stim[13] = 8'h49;
    stim[14] = 8'h59;
    stim[15] = 8'h1e;
    stim[16] = 8'he2;
    stim[17] = 8'hec;
    stim[18] = 8'h98;
    stim[19] = 8'h8e;
    stim[20] = 8'h90;
    stim[21] = 8'hb1;
    stim[22] = 8'h9c;
    stim[23] = 8'h44;
    stim[24] = 8'h75;
    stim[25] = 8'hce;
    stim[26] = 8'h7c;
    stim[27] = 8'hac;
    stim[28] = 8'h07;
    stim[29] = 8'h9b;
    stim[30] = 8'hf7;
    stim[31] = 8'hb4;
    stim[32] = 8'ha9;
    stim[33] = 8'h81;
    stim[34] = 8'hc3;
    stim[35] = 8'hd6;
    stim[36] = 8'hdf;
    stim[37] = 8'hf4;
    stim[38] = 8'hae;
    stim[39] = 8'hd8;
    stim[40] = 8'hdb;
    stim[41] = 8'h7b;
    stim[42] = 8'hf0;
    stim[43] = 8'hd3;
    stim[44] = 8'h82;
    stim[45] = 8'he9;
    stim[46] = 8'h79;
    stim[47] = 8'h43;
    stim[48] = 8'hb9;
    stim[49] = 8'h9d;
    stim[50] = 8'h00;
    stim[51] = 8'ha2;
    stim[52] = 8'h41;
    stim[53] = 8'hd2;
    stim[54] = 8'h97;
    stim[55] = 8'heb;
    stim[56] = 8'h65;
    stim[57] = 8'h85;
    stim[58] = 8'hd9;
    stim[59] = 8'h92;
    stim[60] = 8'he8;
    stim[61] = 8'hf5;
    stim[62] = 8'h4f;
    stim[63] = 8'ha2;
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
      expv[0] = 16'h8790;
      expv[1] = 16'hf982;
      expv[2] = 16'h86a1;
      expv[3] = 16'hf9b0;
      expv[4] = 16'h8782;
      expv[5] = 16'h86f8;
      expv[6] = 16'h8e92;
      expv[7] = 16'h9082;
      expv[8] = 16'h86c0;
      expv[9] = 16'h8080;
      expv[10] = 16'h80c6;
      expv[11] = 16'hf883;
      expv[12] = 16'h80c0;
      expv[13] = 16'h9990;
      expv[14] = 16'h9290;
      expv[15] = 16'hf986;
      expv[16] = 16'h86a4;
      expv[17] = 16'h86c6;
      expv[18] = 16'h9080;
      expv[19] = 16'h8086;
      expv[20] = 16'h90c0;
      expv[21] = 16'h83f9;
      expv[22] = 16'h90c6;
      expv[23] = 16'h9999;
      expv[24] = 16'hf892;
      expv[25] = 16'hc686;
      expv[26] = 16'hf8c6;
      expv[27] = 16'h87c6;
      expv[28] = 16'hc0f8;
      expv[29] = 16'h9083;
      expv[30] = 16'h8ef8;
      expv[31] = 16'h8399;
      expv[32] = 16'h8790;
      expv[33] = 16'h80f9;
      expv[34] = 16'hc6b0;
      expv[35] = 16'ha182;
      expv[36] = 16'ha18e;
      expv[37] = 16'h8e99;
      expv[38] = 16'h8786;
      expv[39] = 16'ha180;
      expv[40] = 16'ha183;
      expv[41] = 16'hf883;
      expv[42] = 16'h8ec0;
      expv[43] = 16'ha1b0;
      expv[44] = 16'h80a4;
      expv[45] = 16'h8690;
      expv[46] = 16'hf890;
      expv[47] = 16'h99b0;
      expv[48] = 16'h8390;
      expv[49] = 16'h90a1;
      expv[50] = 16'hc0c0;
      expv[51] = 16'h87a4;
      expv[52] = 16'h99f9;
      expv[53] = 16'ha1a4;
      expv[54] = 16'h90f8;
      expv[55] = 16'h8683;
      expv[56] = 16'h8292;
      expv[57] = 16'h8092;
      expv[58] = 16'ha190;
      expv[59] = 16'h90a4;
      expv[60] = 16'h8680;
      expv[61] = 16'h8e92;
      expv[62] = 16'h998e;
      expv[63] = 16'h87a4;
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
