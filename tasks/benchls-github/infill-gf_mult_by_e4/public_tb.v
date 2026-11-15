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

  gf_mult_by_e4 dut (
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
    stim[0] = 8'h6e;
    stim[1] = 8'hc2;
    stim[2] = 8'h2a;
    stim[3] = 8'h62;
    stim[4] = 8'h18;
    stim[5] = 8'h53;
    stim[6] = 8'h0e;
    stim[7] = 8'h06;
    stim[8] = 8'ha7;
    stim[9] = 8'he1;
    stim[10] = 8'h31;
    stim[11] = 8'h0c;
    stim[12] = 8'h99;
    stim[13] = 8'h63;
    stim[14] = 8'hdf;
    stim[15] = 8'hd0;
    stim[16] = 8'h53;
    stim[17] = 8'hf6;
    stim[18] = 8'h81;
    stim[19] = 8'h6a;
    stim[20] = 8'h77;
    stim[21] = 8'h3a;
    stim[22] = 8'h82;
    stim[23] = 8'h72;
    stim[24] = 8'h53;
    stim[25] = 8'hec;
    stim[26] = 8'hdd;
    stim[27] = 8'hfc;
    stim[28] = 8'h61;
    stim[29] = 8'hca;
    stim[30] = 8'h8b;
    stim[31] = 8'h83;
    stim[32] = 8'h06;
    stim[33] = 8'h54;
    stim[34] = 8'h4a;
    stim[35] = 8'h13;
    stim[36] = 8'h00;
    stim[37] = 8'hbf;
    stim[38] = 8'hd5;
    stim[39] = 8'hae;
    stim[40] = 8'h49;
    stim[41] = 8'h0c;
    stim[42] = 8'h93;
    stim[43] = 8'h9f;
    stim[44] = 8'hc4;
    stim[45] = 8'hb2;
    stim[46] = 8'h4b;
    stim[47] = 8'hb0;
    stim[48] = 8'h13;
    stim[49] = 8'ha6;
    stim[50] = 8'h49;
    stim[51] = 8'h3b;
    stim[52] = 8'hcc;
    stim[53] = 8'h78;
    stim[54] = 8'h3f;
    stim[55] = 8'h71;
    stim[56] = 8'hd7;
    stim[57] = 8'hb4;
    stim[58] = 8'hd7;
    stim[59] = 8'hab;
    stim[60] = 8'h2e;
    stim[61] = 8'ha6;
    stim[62] = 8'h09;
    stim[63] = 8'h8b;
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
      expv[0] = 8'h7f;
      expv[1] = 8'h09;
      expv[2] = 8'h77;
      expv[3] = 8'hbb;
      expv[4] = 8'h95;
      expv[5] = 8'h68;
      expv[6] = 8'h11;
      expv[7] = 8'h62;
      expv[8] = 8'h34;
      expv[9] = 8'he9;
      expv[10] = 8'hd3;
      expv[11] = 8'hc4;
      expv[12] = 8'h12;
      expv[13] = 8'h5f;
      expv[14] = 8'hcf;
      expv[15] = 8'h3a;
      expv[16] = 8'h68;
      expv[17] = 8'h89;
      expv[18] = 8'h87;
      expv[19] = 8'hc8;
      expv[20] = 8'h0e;
      expv[21] = 8'h91;
      expv[22] = 8'hb6;
      expv[23] = 8'h5d;
      expv[24] = 8'h68;
      expv[25] = 8'hc9;
      expv[26] = 8'h1a;
      expv[27] = 8'h2f;
      expv[28] = 8'h8a;
      expv[29] = 8'h7a;
      expv[30] = 8'h21;
      expv[31] = 8'h52;
      expv[32] = 8'h62;
      expv[33] = 8'hee;
      expv[34] = 8'h19;
      expv[35] = 8'hd7;
      expv[36] = 8'h00;
      expv[37] = 8'ha1;
      expv[38] = 8'h69;
      expv[39] = 8'ha3;
      expv[40] = 8'h28;
      expv[41] = 8'hc4;
      expv[42] = 8'hb4;
      expv[43] = 8'h70;
      expv[44] = 8'h6b;
      expv[45] = 8'h81;
      expv[46] = 8'hfd;
      expv[47] = 8'h54;
      expv[48] = 8'hd7;
      expv[49] = 8'hd0;
      expv[50] = 8'h28;
      expv[51] = 8'h75;
      expv[52] = 8'h18;
      expv[53] = 8'hfb;
      expv[54] = 8'hc2;
      expv[55] = 8'h6c;
      expv[56] = 8'hbc;
      expv[57] = 8'he3;
      expv[58] = 8'hbc;
      expv[59] = 8'hf0;
      expv[60] = 8'hc0;
      expv[61] = 8'hd0;
      expv[62] = 8'h97;
      expv[63] = 8'h21;
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
