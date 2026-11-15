// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04801 dut (
    .clk(clk),
    .n(in_vec[32:1]),
    .start(in_vec[0:0]),
    .fibn(out_vec[32:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1011f43a4;
    stim[1] = 33'h029be1c3f;
    stim[2] = 33'h12d2c4552;
    stim[3] = 33'h01624ea19;
    stim[4] = 33'h144843b5b;
    stim[5] = 33'h0d2f16281;
    stim[6] = 33'h148a2873f;
    stim[7] = 33'h0d9276b2b;
    stim[8] = 33'h1c53f8593;
    stim[9] = 33'h16fd24a1a;
    stim[10] = 33'h1f019e112;
    stim[11] = 33'h0396824e1;
    stim[12] = 33'h051dc8ae1;
    stim[13] = 33'h150b7ed9e;
    stim[14] = 33'h05e8abfa6;
    stim[15] = 33'h0e9801efc;
    stim[16] = 33'h02b42f0f9;
    stim[17] = 33'h1356fc5aa;
    stim[18] = 33'h0e1da20c1;
    stim[19] = 33'h1ea794de2;
    stim[20] = 33'h082380671;
    stim[21] = 33'h0d7add6a8;
    stim[22] = 33'h1a2f35c18;
    stim[23] = 33'h1aced4389;
    stim[24] = 33'h14c53061e;
    stim[25] = 33'h0b0260e69;
    stim[26] = 33'h176e554c6;
    stim[27] = 33'h06c40b062;
    stim[28] = 33'h0da298c24;
    stim[29] = 33'h025b888bc;
    stim[30] = 33'h11ea218bc;
    stim[31] = 33'h083ac8f5d;
    stim[32] = 33'h0fdc9137c;
    stim[33] = 33'h0c06457b5;
    stim[34] = 33'h01e8e60cc;
    stim[35] = 33'h1f446c806;
    stim[36] = 33'h123e69638;
    stim[37] = 33'h100472dc3;
    stim[38] = 33'h09598c869;
    stim[39] = 33'h1b7c4354c;
    stim[40] = 33'h0e91b6378;
    stim[41] = 33'h12f0a35c6;
    stim[42] = 33'h0d6069a62;
    stim[43] = 33'h0b8a139ce;
    stim[44] = 33'h1e458b149;
    stim[45] = 33'h1fac4bd83;
    stim[46] = 33'h0e12d7e48;
    stim[47] = 33'h1e624609b;
    stim[48] = 33'h00f96f3d6;
    stim[49] = 33'h17b9f5cab;
    stim[50] = 33'h12e46ccba;
    stim[51] = 33'h0eb7c4205;
    stim[52] = 33'h123f9d658;
    stim[53] = 33'h13d144b33;
    stim[54] = 33'h0d98f43b7;
    stim[55] = 33'h1337e9748;
    stim[56] = 33'h152fc497f;
    stim[57] = 33'h149d6d43f;
    stim[58] = 33'h05c879f7a;
    stim[59] = 33'h0ae8cc1e2;
    stim[60] = 33'h0fb72456d;
    stim[61] = 33'h1a8cd4abd;
    stim[62] = 33'h0da943157;
    stim[63] = 33'h12072dac9;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'hxxxxxxxxx;
      expv[2] = 33'h000000001;
      expv[3] = 33'h000000001;
      expv[4] = 33'h000000001;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000002;
      expv[11] = 33'h000000002;
      expv[12] = 33'h000000002;
      expv[13] = 33'h000000002;
      expv[14] = 33'h000000002;
      expv[15] = 33'h000000002;
      expv[16] = 33'h000000002;
      expv[17] = 33'h000000002;
      expv[18] = 33'h000000010;
      expv[19] = 33'h00000006e;
      expv[20] = 33'h00000006e;
      expv[21] = 33'h00000006e;
      expv[22] = 33'h00000006e;
      expv[23] = 33'h00000006e;
      expv[24] = 33'h00000006e;
      expv[25] = 33'h00000006e;
      expv[26] = 33'h00000006e;
      expv[27] = 33'h00000006e;
      expv[28] = 33'h00000006e;
      expv[29] = 33'h00000006e;
      expv[30] = 33'h00000006e;
      expv[31] = 33'h00000006e;
      expv[32] = 33'h00000006e;
      expv[33] = 33'h00000006e;
      expv[34] = 33'h00000006e;
      expv[35] = 33'h00000006e;
      expv[36] = 33'h00000006e;
      expv[37] = 33'h00000006e;
      expv[38] = 33'h1c4d94622;
      expv[39] = 33'h1e9384d70;
      expv[40] = 33'h1e9384d70;
      expv[41] = 33'h1e9384d70;
      expv[42] = 33'h1e9384d70;
      expv[43] = 33'h1e9384d70;
      expv[44] = 33'h1e9384d70;
      expv[45] = 33'h1e9384d70;
      expv[46] = 33'h1ba5d986e;
      expv[47] = 33'h054224a22;
      expv[48] = 33'h054224a22;
      expv[49] = 33'h054224a22;
      expv[50] = 33'h054224a22;
      expv[51] = 33'h054224a22;
      expv[52] = 33'h054224a22;
      expv[53] = 33'h054224a22;
      expv[54] = 33'h194b48d70;
      expv[55] = 33'h0b86f286e;
      expv[56] = 33'h0b86f286e;
      expv[57] = 33'h0b86f286e;
      expv[58] = 33'h0b86f286e;
      expv[59] = 33'h0b86f286e;
      expv[60] = 33'h0b86f286e;
      expv[61] = 33'h0b86f286e;
      expv[62] = 33'h0b86f286e;
      expv[63] = 33'h0b86f286e;
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
