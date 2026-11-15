// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 38;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_052259 dut (
    .clk(clk),
    .data_in(in_vec[34:3]),
    .reset(in_vec[2:2]),
    .push(in_vec[1:1]),
    .pop(in_vec[0:0]),
    .data_out(out_vec[37:6]),
    .sp(out_vec[5:1]),
    .full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h730ea6545;
    stim[1] = 35'h5af19af45;
    stim[2] = 35'h3f7833ed0;
    stim[3] = 35'h5cc2c0c98;
    stim[4] = 35'h3901a9983;
    stim[5] = 35'h48321b921;
    stim[6] = 35'h76a018759;
    stim[7] = 35'h21ca5fd53;
    stim[8] = 35'h245dfd010;
    stim[9] = 35'h324ff90ea;
    stim[10] = 35'h5215b543b;
    stim[11] = 35'h2d496f7d3;
    stim[12] = 35'h218c05e49;
    stim[13] = 35'h34f4d15a0;
    stim[14] = 35'h654432863;
    stim[15] = 35'h7e43950b3;
    stim[16] = 35'h354de8b20;
    stim[17] = 35'h3eb501f79;
    stim[18] = 35'h4a1291471;
    stim[19] = 35'h2bae72dd8;
    stim[20] = 35'h31f0e16c1;
    stim[21] = 35'h2be124c69;
    stim[22] = 35'h1e34c07a9;
    stim[23] = 35'h4e159cd3a;
    stim[24] = 35'h3f10bde78;
    stim[25] = 35'h4a4cf0710;
    stim[26] = 35'h2b54582c8;
    stim[27] = 35'h781512320;
    stim[28] = 35'h16c4a1512;
    stim[29] = 35'h7f5f25499;
    stim[30] = 35'h0898be649;
    stim[31] = 35'h5024ea828;
    stim[32] = 35'h3e8b5d8d1;
    stim[33] = 35'h3e008bc93;
    stim[34] = 35'h4f67c34b1;
    stim[35] = 35'h28cbaf12a;
    stim[36] = 35'h279012f70;
    stim[37] = 35'h099851369;
    stim[38] = 35'h4cadcba71;
    stim[39] = 35'h7eeca7473;
    stim[40] = 35'h1f66517b0;
    stim[41] = 35'h517ded06a;
    stim[42] = 35'h106755ac9;
    stim[43] = 35'h75dc1e15b;
    stim[44] = 35'h1309cf272;
    stim[45] = 35'h0c211528a;
    stim[46] = 35'h6fca327f9;
    stim[47] = 35'h016851680;
    stim[48] = 35'h50fb31f02;
    stim[49] = 35'h1888ddaf9;
    stim[50] = 35'h6e39e5a99;
    stim[51] = 35'h2e330a4fa;
    stim[52] = 35'h3198efc2b;
    stim[53] = 35'h119b1fb19;
    stim[54] = 35'h0b95e7a60;
    stim[55] = 35'h699645663;
    stim[56] = 35'h690a58549;
    stim[57] = 35'h6e3b2ede8;
    stim[58] = 35'h10db224b9;
    stim[59] = 35'h7dd72930a;
    stim[60] = 35'h36fed4a29;
    stim[61] = 35'h5bd360923;
    stim[62] = 35'h560ba8c53;
    stim[63] = 35'h10e568ee9;
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
      expv[0] = 38'hxxxxxxxxxx;
      expv[1] = 38'h000000003e;
      expv[2] = 38'h000000003e;
      expv[3] = 38'h000000003e;
      expv[4] = 38'h000000003e;
      expv[5] = 38'h1c80d4cc3e;
      expv[6] = 38'hxxxxxxxxxc;
      expv[7] = 38'hxxxxxxxxxa;
      expv[8] = 38'h10e52feaba;
      expv[9] = 38'h10e52feaba;
      expv[10] = 38'h10e52feaba;
      expv[11] = 38'h290adaa1fa;
      expv[12] = 38'h16a4b7beba;
      expv[13] = 38'hxxxxxxxxx8;
      expv[14] = 38'hxxxxxxxxx8;
      expv[15] = 38'h32a2194338;
      expv[16] = 38'h3f21ca85b8;
      expv[17] = 38'h3f21ca85b8;
      expv[18] = 38'hxxxxxxxxx6;
      expv[19] = 38'hxxxxxxxxx4;
      expv[20] = 38'hxxxxxxxxx4;
      expv[21] = 38'hxxxxxxxxx2;
      expv[22] = 38'hxxxxxxxxx0;
      expv[23] = 38'hxxxxxxxxxe;
      expv[24] = 38'hxxxxxxxxxe;
      expv[25] = 38'hxxxxxxxxxe;
      expv[26] = 38'hxxxxxxxxxe;
      expv[27] = 38'hxxxxxxxxxe;
      expv[28] = 38'hxxxxxxxxxe;
      expv[29] = 38'hxxxxxxxxxe;
      expv[30] = 38'hxxxxxxxxxc;
      expv[31] = 38'hxxxxxxxxxa;
      expv[32] = 38'hxxxxxxxxxa;
      expv[33] = 38'hxxxxxxxxx8;
      expv[34] = 38'h1f0045e4a8;
      expv[35] = 38'hxxxxxxxxx6;
      expv[36] = 38'hxxxxxxxxx6;
      expv[37] = 38'hxxxxxxxxx6;
      expv[38] = 38'hxxxxxxxxx4;
      expv[39] = 38'hxxxxxxxxx2;
      expv[40] = 38'h3f7653a3a2;
      expv[41] = 38'h3f7653a3a2;
      expv[42] = 38'h3f7653a3a2;
      expv[43] = 38'hxxxxxxxxx0;
      expv[44] = 38'h3aee0f0ae0;
      expv[45] = 38'h3aee0f0ae0;
      expv[46] = 38'h3aee0f0ae0;
      expv[47] = 38'hxxxxxxxxxe;
      expv[48] = 38'hxxxxxxxxxe;
      expv[49] = 38'hxxxxxxxxxe;
      expv[50] = 38'h000000001c;
      expv[51] = 38'h000000001a;
      expv[52] = 38'h000000001c;
      expv[53] = 38'h18cc77e15c;
      expv[54] = 38'h17198527da;
      expv[55] = 38'h17198527da;
      expv[56] = 38'h34cb22b31a;
      expv[57] = 38'h0000000018;
      expv[58] = 38'h0000000018;
      expv[59] = 38'h0000000016;
      expv[60] = 38'h0000000018;
      expv[61] = 38'h3eeb949856;
      expv[62] = 38'h2de9b04916;
      expv[63] = 38'h2b05d46296;
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
