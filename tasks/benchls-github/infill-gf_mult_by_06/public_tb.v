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

  gf_mult_by_06 dut (
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
    stim[0] = 8'hbe;
    stim[1] = 8'h73;
    stim[2] = 8'h54;
    stim[3] = 8'h93;
    stim[4] = 8'hed;
    stim[5] = 8'h4a;
    stim[6] = 8'h33;
    stim[7] = 8'h23;
    stim[8] = 8'h5a;
    stim[9] = 8'h42;
    stim[10] = 8'h1e;
    stim[11] = 8'hca;
    stim[12] = 8'h47;
    stim[13] = 8'h6d;
    stim[14] = 8'h8e;
    stim[15] = 8'hbb;
    stim[16] = 8'h1a;
    stim[17] = 8'h75;
    stim[18] = 8'h11;
    stim[19] = 8'h2d;
    stim[20] = 8'h97;
    stim[21] = 8'h5b;
    stim[22] = 8'h8e;
    stim[23] = 8'h58;
    stim[24] = 8'hd4;
    stim[25] = 8'h7a;
    stim[26] = 8'h5e;
    stim[27] = 8'h7f;
    stim[28] = 8'h48;
    stim[29] = 8'h66;
    stim[30] = 8'h4b;
    stim[31] = 8'h57;
    stim[32] = 8'he3;
    stim[33] = 8'hed;
    stim[34] = 8'hfd;
    stim[35] = 8'h2e;
    stim[36] = 8'h20;
    stim[37] = 8'hb8;
    stim[38] = 8'h23;
    stim[39] = 8'h95;
    stim[40] = 8'h3e;
    stim[41] = 8'h4e;
    stim[42] = 8'h48;
    stim[43] = 8'h09;
    stim[44] = 8'haa;
    stim[45] = 8'h23;
    stim[46] = 8'h88;
    stim[47] = 8'hab;
    stim[48] = 8'h91;
    stim[49] = 8'h32;
    stim[50] = 8'hd0;
    stim[51] = 8'h24;
    stim[52] = 8'h3f;
    stim[53] = 8'h95;
    stim[54] = 8'hbd;
    stim[55] = 8'hde;
    stim[56] = 8'h66;
    stim[57] = 8'h7e;
    stim[58] = 8'h4c;
    stim[59] = 8'hdf;
    stim[60] = 8'h42;
    stim[61] = 8'hf0;
    stim[62] = 8'h6e;
    stim[63] = 8'h65;
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
      expv[0] = 8'ha3;
      expv[1] = 8'h37;
      expv[2] = 8'he5;
      expv[3] = 8'h4d;
      expv[4] = 8'h54;
      expv[5] = 8'ha1;
      expv[6] = 8'haa;
      expv[7] = 8'hca;
      expv[8] = 8'hc1;
      expv[9] = 8'h91;
      expv[10] = 8'h44;
      expv[11] = 8'h86;
      expv[12] = 8'h8f;
      expv[13] = 8'h73;
      expv[14] = 8'h03;
      expv[15] = 8'hbd;
      expv[16] = 8'h5c;
      expv[17] = 8'h23;
      expv[18] = 8'h66;
      expv[19] = 8'hee;
      expv[20] = 8'h55;
      expv[21] = 8'hc7;
      expv[22] = 8'h03;
      expv[23] = 8'hcd;
      expv[24] = 8'hc2;
      expv[25] = 8'h01;
      expv[26] = 8'hd9;
      expv[27] = 8'h1f;
      expv[28] = 8'had;
      expv[29] = 8'h49;
      expv[30] = 8'ha7;
      expv[31] = 8'hef;
      expv[32] = 8'h70;
      expv[33] = 8'h54;
      expv[34] = 8'h34;
      expv[35] = 8'he4;
      expv[36] = 8'hc0;
      expv[37] = 8'hb7;
      expv[38] = 8'hca;
      expv[39] = 8'h59;
      expv[40] = 8'h84;
      expv[41] = 8'hb9;
      expv[42] = 8'had;
      expv[43] = 8'h36;
      expv[44] = 8'hdb;
      expv[45] = 8'hca;
      expv[46] = 8'h17;
      expv[47] = 8'hdd;
      expv[48] = 8'h41;
      expv[49] = 8'hac;
      expv[50] = 8'hda;
      expv[51] = 8'hd8;
      expv[52] = 8'h82;
      expv[53] = 8'h59;
      expv[54] = 8'ha9;
      expv[55] = 8'hfe;
      expv[56] = 8'h49;
      expv[57] = 8'h19;
      expv[58] = 8'hb5;
      expv[59] = 8'hf8;
      expv[60] = 8'h91;
      expv[61] = 8'h1a;
      expv[62] = 8'h79;
      expv[63] = 8'h43;
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
