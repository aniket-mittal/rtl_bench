// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_178434 dut (
    .raw_dmem(in_vec[36:5]),
    .LdSel(in_vec[4:2]),
    .shamt(in_vec[1:0]),
    .wb_dmem(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1b1ab0335b;
    stim[1] = 37'h050018603e;
    stim[2] = 37'h06d1391b87;
    stim[3] = 37'h02c107701b;
    stim[4] = 37'h0aa832af91;
    stim[5] = 37'h1a7a4935a9;
    stim[6] = 37'h1464f174e4;
    stim[7] = 37'h0932fd3639;
    stim[8] = 37'h1f2a10e80a;
    stim[9] = 37'h03f732640c;
    stim[10] = 37'h174a1f2f88;
    stim[11] = 37'h01bc93b879;
    stim[12] = 37'h10d57c529a;
    stim[13] = 37'h09501149b7;
    stim[14] = 37'h0e6cdfa508;
    stim[15] = 37'h13df10316d;
    stim[16] = 37'h19758064d9;
    stim[17] = 37'h1170b96e73;
    stim[18] = 37'h1e307aec69;
    stim[19] = 37'h0aacc2a015;
    stim[20] = 37'h1e26bb4168;
    stim[21] = 37'h1580e1307d;
    stim[22] = 37'h1fa88caf74;
    stim[23] = 37'h1ecf84d13f;
    stim[24] = 37'h0ec29f3dfb;
    stim[25] = 37'h11cca3504e;
    stim[26] = 37'h16dc6c1ae7;
    stim[27] = 37'h0733de7fe3;
    stim[28] = 37'h123f47404c;
    stim[29] = 37'h0e0ab2fddd;
    stim[30] = 37'h0102580baa;
    stim[31] = 37'h0b20c17b2a;
    stim[32] = 37'h11d1bda24d;
    stim[33] = 37'h0cfb8495b0;
    stim[34] = 37'h02a25663f6;
    stim[35] = 37'h07f09d6b4f;
    stim[36] = 37'h077488d811;
    stim[37] = 37'h11b53c7f5a;
    stim[38] = 37'h1707c843cc;
    stim[39] = 37'h15b912366c;
    stim[40] = 37'h028a484ee2;
    stim[41] = 37'h0930c2c1e7;
    stim[42] = 37'h1811a0f328;
    stim[43] = 37'h1835f66bdf;
    stim[44] = 37'h0adca6ae3b;
    stim[45] = 37'h1a6aa4f6fd;
    stim[46] = 37'h0d85a92156;
    stim[47] = 37'h19dd430131;
    stim[48] = 37'h17a6a64102;
    stim[49] = 37'h1ab37a65d4;
    stim[50] = 37'h14bb385be4;
    stim[51] = 37'h03281db31e;
    stim[52] = 37'h1565768546;
    stim[53] = 37'h02f9420560;
    stim[54] = 37'h07e6882b53;
    stim[55] = 37'h19d1ce44cf;
    stim[56] = 37'h0e2e8b4fd3;
    stim[57] = 37'h18d35bf8c6;
    stim[58] = 37'h1ab67658fb;
    stim[59] = 37'h1239d89c65;
    stim[60] = 37'h071e895267;
    stim[61] = 37'h03964fab12;
    stim[62] = 37'h1a5b762455;
    stim[63] = 37'h1ebd3bbd76;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'h3689c8dc;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'h00004195;
      expv[5] = 32'hd3d249ad;
      expv[6] = 32'hffffffa7;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hf9508740;
      expv[9] = 32'h00000020;
      expv[10] = 32'hba50f97c;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'h7366fd28;
      expv[15] = 32'h00000081;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'h8b85cb73;
      expv[18] = 32'hf183d763;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hf135da0b;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'h00000065;
      expv[26] = 32'hb6e360d7;
      expv[27] = 32'h00000039;
      expv[28] = 32'h00000002;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'h0812c05d;
      expv[31] = 32'h59060bd9;
      expv[32] = 32'h000000ed;
      expv[33] = 32'h000024ad;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'h0000003f;
      expv[36] = 32'h0000a446;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'h0000001e;
      expv[39] = 32'h000000b3;
      expv[40] = 32'h00000052;
      expv[41] = 32'h4986160f;
      expv[42] = 32'hc08d0799;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'h0000ea18;
      expv[48] = 32'h00000035;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'hffffffdf;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'h002bb42a;
      expv[53] = 32'h0000002b;
      expv[54] = 32'h3f34415a;
      expv[55] = 32'h000000ce;
      expv[56] = 32'h71745a7e;
      expv[57] = 32'hff9adfc6;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hffffc4e3;
      expv[60] = 32'h38f44a93;
      expv[61] = 32'h00001cb2;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
