// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  gf_mult_by_99 dut (
    .i(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h8f;
    stim[1] = 8'ha0;
    stim[2] = 8'h79;
    stim[3] = 8'hd0;
    stim[4] = 8'h95;
    stim[5] = 8'hf9;
    stim[6] = 8'hfb;
    stim[7] = 8'h26;
    stim[8] = 8'hb7;
    stim[9] = 8'h5d;
    stim[10] = 8'h6d;
    stim[11] = 8'hef;
    stim[12] = 8'h03;
    stim[13] = 8'h78;
    stim[14] = 8'hbd;
    stim[15] = 8'hb8;
    stim[16] = 8'h5c;
    stim[17] = 8'h14;
    stim[18] = 8'h00;
    stim[19] = 8'haf;
    stim[20] = 8'h2b;
    stim[21] = 8'hd9;
    stim[22] = 8'hda;
    stim[23] = 8'ha0;
    stim[24] = 8'hc6;
    stim[25] = 8'h18;
    stim[26] = 8'hbc;
    stim[27] = 8'hf5;
    stim[28] = 8'hd6;
    stim[29] = 8'h19;
    stim[30] = 8'h1d;
    stim[31] = 8'h58;
    stim[32] = 8'hdf;
    stim[33] = 8'h82;
    stim[34] = 8'hb6;
    stim[35] = 8'h3c;
    stim[36] = 8'h46;
    stim[37] = 8'h19;
    stim[38] = 8'h47;
    stim[39] = 8'h43;
    stim[40] = 8'h40;
    stim[41] = 8'h78;
    stim[42] = 8'ha8;
    stim[43] = 8'h61;
    stim[44] = 8'hf2;
    stim[45] = 8'hf2;
    stim[46] = 8'hc3;
    stim[47] = 8'h70;
    stim[48] = 8'h86;
    stim[49] = 8'hab;
    stim[50] = 8'hca;
    stim[51] = 8'h86;
    stim[52] = 8'h8d;
    stim[53] = 8'he4;
    stim[54] = 8'hb5;
    stim[55] = 8'h66;
    stim[56] = 8'h1d;
    stim[57] = 8'h93;
    stim[58] = 8'h5a;
    stim[59] = 8'hb2;
    stim[60] = 8'he2;
    stim[61] = 8'hc4;
    stim[62] = 8'hdd;
    stim[63] = 8'h33;
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
      expv[0] = 8'h5b;
      expv[1] = 8'hc5;
      expv[2] = 8'h03;
      expv[3] = 8'he3;
      expv[4] = 8'had;
      expv[5] = 8'h0c;
      expv[6] = 8'h23;
      expv[7] = 8'hbb;
      expv[8] = 8'h48;
      expv[9] = 8'h97;
      expv[10] = 8'h38;
      expv[11] = 8'h18;
      expv[12] = 8'hb6;
      expv[13] = 8'h9a;
      expv[14] = 8'hdb;
      expv[15] = 8'h1c;
      expv[16] = 8'h0e;
      expv[17] = 8'h3b;
      expv[18] = 8'h00;
      expv[19] = 8'h91;
      expv[20] = 8'hc0;
      expv[21] = 8'hc6;
      expv[22] = 8'h70;
      expv[23] = 8'hc5;
      expv[24] = 8'hf7;
      expv[25] = 8'hd9;
      expv[26] = 8'h42;
      expv[27] = 8'hee;
      expv[28] = 8'h92;
      expv[29] = 8'h40;
      expv[30] = 8'h1e;
      expv[31] = 8'h50;
      expv[32] = 8'hb7;
      expv[33] = 8'h20;
      expv[34] = 8'hd1;
      expv[35] = 8'h4d;
      expv[36] = 8'hf8;
      expv[37] = 8'h40;
      expv[38] = 8'h61;
      expv[39] = 8'h3f;
      expv[40] = 8'h89;
      expv[41] = 8'h9a;
      expv[42] = 8'h79;
      expv[43] = 8'hda;
      expv[44] = 8'h06;
      expv[45] = 8'h06;
      expv[46] = 8'h30;
      expv[47] = 8'h26;
      expv[48] = 8'h7e;
      expv[49] = 8'hcf;
      expv[50] = 8'h15;
      expv[51] = 8'h7e;
      expv[52] = 8'h74;
      expv[53] = 8'h12;
      expv[54] = 8'h67;
      expv[55] = 8'h32;
      expv[56] = 8'h1e;
      expv[57] = 8'hdc;
      expv[58] = 8'h7f;
      expv[59] = 8'h8f;
      expv[60] = 8'h63;
      expv[61] = 8'hd8;
      expv[62] = 8'h98;
      expv[63] = 8'h19;
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
