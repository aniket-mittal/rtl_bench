// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_118878 dut (
    .alu_op(in_vec[7:7]),
    .s(in_vec[6:6]),
    .branch(in_vec[5:5]),
    .mult(in_vec[4:4]),
    .cmd(in_vec[3:0]),
    .no_write(out_vec[9:9]),
    .not_alu(out_vec[8:8]),
    .not_shift(out_vec[7:7]),
    .swap(out_vec[6:6]),
    .inv(out_vec[5:5]),
    .alu_ctl(out_vec[4:2]),
    .flag_w(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h60;
    stim[1] = 8'h56;
    stim[2] = 8'h48;
    stim[3] = 8'h44;
    stim[4] = 8'h3f;
    stim[5] = 8'hbb;
    stim[6] = 8'h7e;
    stim[7] = 8'h7d;
    stim[8] = 8'hc5;
    stim[9] = 8'h4c;
    stim[10] = 8'heb;
    stim[11] = 8'hfe;
    stim[12] = 8'hdd;
    stim[13] = 8'he6;
    stim[14] = 8'hfb;
    stim[15] = 8'hf4;
    stim[16] = 8'h12;
    stim[17] = 8'hba;
    stim[18] = 8'h8f;
    stim[19] = 8'hc6;
    stim[20] = 8'hcb;
    stim[21] = 8'hc3;
    stim[22] = 8'hd9;
    stim[23] = 8'h9d;
    stim[24] = 8'h70;
    stim[25] = 8'h6b;
    stim[26] = 8'h99;
    stim[27] = 8'hac;
    stim[28] = 8'h74;
    stim[29] = 8'h6e;
    stim[30] = 8'hf6;
    stim[31] = 8'hc6;
    stim[32] = 8'h62;
    stim[33] = 8'hcc;
    stim[34] = 8'hdc;
    stim[35] = 8'hd3;
    stim[36] = 8'h70;
    stim[37] = 8'h6f;
    stim[38] = 8'hd6;
    stim[39] = 8'hf3;
    stim[40] = 8'he8;
    stim[41] = 8'h87;
    stim[42] = 8'h4a;
    stim[43] = 8'h90;
    stim[44] = 8'h27;
    stim[45] = 8'h47;
    stim[46] = 8'h97;
    stim[47] = 8'hf7;
    stim[48] = 8'he1;
    stim[49] = 8'h70;
    stim[50] = 8'h69;
    stim[51] = 8'h77;
    stim[52] = 8'h07;
    stim[53] = 8'h87;
    stim[54] = 8'h2a;
    stim[55] = 8'h34;
    stim[56] = 8'ha0;
    stim[57] = 8'h26;
    stim[58] = 8'hf2;
    stim[59] = 8'h06;
    stim[60] = 8'h35;
    stim[61] = 8'h7c;
    stim[62] = 8'h03;
    stim[63] = 8'h75;
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
      expv[0] = 10'h088;
      expv[1] = 10'h18c;
      expv[2] = 10'h08c;
      expv[3] = 10'h00f;
      expv[4] = 10'h18c;
      expv[5] = 10'h208;
      expv[6] = 10'h18c;
      expv[7] = 10'h18c;
      expv[8] = 10'h02e;
      expv[9] = 10'h08c;
      expv[10] = 10'h20a;
      expv[11] = 10'h01a;
      expv[12] = 10'h096;
      expv[13] = 10'h06a;
      expv[14] = 10'h20a;
      expv[15] = 10'h00e;
      expv[16] = 10'h18c;
      expv[17] = 10'h248;
      expv[18] = 10'h09c;
      expv[19] = 10'h06a;
      expv[20] = 10'h20a;
      expv[21] = 10'h00a;
      expv[22] = 10'h207;
      expv[23] = 10'h094;
      expv[24] = 10'h18c;
      expv[25] = 10'h088;
      expv[26] = 10'h204;
      expv[27] = 10'h010;
      expv[28] = 10'h18c;
      expv[29] = 10'h088;
      expv[30] = 10'h06a;
      expv[31] = 10'h06a;
      expv[32] = 10'h088;
      expv[33] = 10'h012;
      expv[34] = 10'h012;
      expv[35] = 10'h00a;
      expv[36] = 10'h18c;
      expv[37] = 10'h088;
      expv[38] = 10'h06a;
      expv[39] = 10'h00a;
      expv[40] = 10'h203;
      expv[41] = 10'h028;
      expv[42] = 10'h08c;
      expv[43] = 10'h000;
      expv[44] = 10'h088;
      expv[45] = 10'h00f;
      expv[46] = 10'h028;
      expv[47] = 10'h02a;
      expv[48] = 10'h007;
      expv[49] = 10'h18c;
      expv[50] = 10'h088;
      expv[51] = 10'h18c;
      expv[52] = 10'h08e;
      expv[53] = 10'h028;
      expv[54] = 10'h088;
      expv[55] = 10'h18c;
      expv[56] = 10'h000;
      expv[57] = 10'h088;
      expv[58] = 10'h04a;
      expv[59] = 10'h08e;
      expv[60] = 10'h18c;
      expv[61] = 10'h18c;
      expv[62] = 10'h08e;
      expv[63] = 10'h18c;
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
