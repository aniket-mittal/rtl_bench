// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_026234 dut (
    .clk(clk),
    .address(in_vec[40:39]),
    .chipselect(in_vec[38:38]),
    .in_port(in_vec[37:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h1fd7ea3ca6a;
    stim[1] = 41'h1eda866ce8a;
    stim[2] = 41'h0cac2d9f44e;
    stim[3] = 41'h16a88872e08;
    stim[4] = 41'h0a6fa63b8cf;
    stim[5] = 41'h053e46b1f0a;
    stim[6] = 41'h06bad551602;
    stim[7] = 41'h05e66682a0c;
    stim[8] = 41'h12b84ff79c6;
    stim[9] = 41'h1ce34e5fe2b;
    stim[10] = 41'h042b38d800e;
    stim[11] = 41'h09a44957646;
    stim[12] = 41'h0f2a2a8d943;
    stim[13] = 41'h1a7554cd45f;
    stim[14] = 41'h0323b8dd613;
    stim[15] = 41'h19f95de8b4d;
    stim[16] = 41'h1cb7058bd82;
    stim[17] = 41'h0c7ccccca63;
    stim[18] = 41'h12269f29f99;
    stim[19] = 41'h12fda137438;
    stim[20] = 41'h0c23dc25bc3;
    stim[21] = 41'h0ab259b38ac;
    stim[22] = 41'h0a7cbf14778;
    stim[23] = 41'h01e414baa1c;
    stim[24] = 41'h09939eb0395;
    stim[25] = 41'h00a69f19a3a;
    stim[26] = 41'h053320c92ff;
    stim[27] = 41'h0778ff0922c;
    stim[28] = 41'h1e70898fb5c;
    stim[29] = 41'h1c64e66f189;
    stim[30] = 41'h1a72da62777;
    stim[31] = 41'h0d388463939;
    stim[32] = 41'h1e2c4dc08a4;
    stim[33] = 41'h1735626a0d5;
    stim[34] = 41'h1fae23313f8;
    stim[35] = 41'h097f04121cd;
    stim[36] = 41'h0feee8314b4;
    stim[37] = 41'h04e18bb6dd6;
    stim[38] = 41'h0e261b73e88;
    stim[39] = 41'h01e353ffbcb;
    stim[40] = 41'h0b2b4d5baf6;
    stim[41] = 41'h123fbc0863f;
    stim[42] = 41'h03ff8508394;
    stim[43] = 41'h1e3ec0a6071;
    stim[44] = 41'h086ace64db4;
    stim[45] = 41'h1a6117437ae;
    stim[46] = 41'h1f601e0c43d;
    stim[47] = 41'h17e94eaff8d;
    stim[48] = 41'h0875983fbfb;
    stim[49] = 41'h0c60bf66a2d;
    stim[50] = 41'h04340739f63;
    stim[51] = 41'h15f2c95089a;
    stim[52] = 41'h05b4b4fa19c;
    stim[53] = 41'h0dbbb179a71;
    stim[54] = 41'h1fa88eeeebc;
    stim[55] = 41'h0ea3f5f6c72;
    stim[56] = 41'h04bb2f578a4;
    stim[57] = 41'h1ce3a7b6491;
    stim[58] = 41'h0cf81450d4d;
    stim[59] = 41'h0f2f7a7c7b1;
    stim[60] = 41'h1432fb57711;
    stim[61] = 41'h1e2ce8e4a3d;
    stim[62] = 41'h0bf0e40ce87;
    stim[63] = 41'h18b37db2b92;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000004;
      expv[7] = 33'h10000000a;
      expv[8] = 33'h100000007;
      expv[9] = 33'h100000008;
      expv[10] = 33'h00000000f;
      expv[11] = 33'h100000000;
      expv[12] = 33'h100000000;
      expv[13] = 33'h100000000;
      expv[14] = 33'h10000000b;
      expv[15] = 33'h10000000c;
      expv[16] = 33'h10000000f;
      expv[17] = 33'h10000000f;
      expv[18] = 33'h100000000;
      expv[19] = 33'h100000008;
      expv[20] = 33'h100000008;
      expv[21] = 33'h100000000;
      expv[22] = 33'h100000000;
      expv[23] = 33'h100000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000002;
      expv[27] = 33'h000000004;
      expv[28] = 33'h00000000d;
      expv[29] = 33'h000000002;
      expv[30] = 33'h000000002;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000008;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000004;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000003;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000007;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h00000000f;
      expv[44] = 33'h00000000f;
      expv[45] = 33'h000000000;
      expv[46] = 33'h00000000f;
      expv[47] = 33'h00000000f;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h100000000;
      expv[51] = 33'h100000000;
      expv[52] = 33'h10000000d;
      expv[53] = 33'h100000006;
      expv[54] = 33'h100000000;
      expv[55] = 33'h00000000f;
      expv[56] = 33'h000000000;
      expv[57] = 33'h100000002;
      expv[58] = 33'h000000004;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h10000000d;
      expv[62] = 33'h000000003;
      expv[63] = 33'h000000000;
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
