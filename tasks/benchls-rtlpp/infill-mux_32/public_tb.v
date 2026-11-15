// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mux_32 dut (
    .sel(in_vec[64:64]),
    .src0(in_vec[63:32]),
    .src1(in_vec[31:0]),
    .z(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h166cbb7782a0428f3;
    stim[1] = 65'h1d7f20c37c4eed3e9;
    stim[2] = 65'h0539eed47dd41e365;
    stim[3] = 65'h01158ba5b364a26cc;
    stim[4] = 65'h11c3177d24144817b;
    stim[5] = 65'h139d6e45c3efacb01;
    stim[6] = 65'h17cbd144f8a67a8fb;
    stim[7] = 65'h1f9b143a5481e20ed;
    stim[8] = 65'h061b65fe20634ade6;
    stim[9] = 65'h0e49e213fcdf50e83;
    stim[10] = 65'h190cf2efa7a4bd7e2;
    stim[11] = 65'h129e4f05b0a1b5362;
    stim[12] = 65'h06e3f384c84bfca0d;
    stim[13] = 65'h1aeea14900acfa680;
    stim[14] = 65'h0a531011fd2838bd3;
    stim[15] = 65'h0f227fcf8b6d806a5;
    stim[16] = 65'h1c2472a2a232a678e;
    stim[17] = 65'h0b82a127c139d151c;
    stim[18] = 65'h0434be4b7205d9c22;
    stim[19] = 65'h1517df69da5a5ec95;
    stim[20] = 65'h1f18fee17cb8c711f;
    stim[21] = 65'h0891ec614e6eb28d1;
    stim[22] = 65'h10c2665439e5e1d1a;
    stim[23] = 65'h1dd43254ab25078e1;
    stim[24] = 65'h1c18d3a2ecac4b217;
    stim[25] = 65'h1e24333903d4a80af;
    stim[26] = 65'h1cb6a51a375a4ec44;
    stim[27] = 65'h0e41ace92a4deb12d;
    stim[28] = 65'h0f317066c99b60720;
    stim[29] = 65'h11a961b2202d7f8e6;
    stim[30] = 65'h1b4287f7bd33eef80;
    stim[31] = 65'h118cce9e491126d2b;
    stim[32] = 65'h0950125b88ec0dabc;
    stim[33] = 65'h04b48a9f37cb14945;
    stim[34] = 65'h0f45570e42018906f;
    stim[35] = 65'h154fa294ec6724d10;
    stim[36] = 65'h1139397938384176f;
    stim[37] = 65'h1359da5871be75242;
    stim[38] = 65'h070dc30008117de48;
    stim[39] = 65'h1b19dbc6fcca7290b;
    stim[40] = 65'h01d271c04bd418ab2;
    stim[41] = 65'h1a97d0ddd4ded81b7;
    stim[42] = 65'h1e7c4ff9058798ecf;
    stim[43] = 65'h18f51c87039af2816;
    stim[44] = 65'h068f6d2f0c19f62d0;
    stim[45] = 65'h00ad808a29e0ae697;
    stim[46] = 65'h068aa1e1958b0daae;
    stim[47] = 65'h0e9f1ba71d0c37a4f;
    stim[48] = 65'h130ea54f56edfca9c;
    stim[49] = 65'h177fe2881104c8a81;
    stim[50] = 65'h116b2d0069ef313a9;
    stim[51] = 65'h160bc6c7e5160c977;
    stim[52] = 65'h0afb501a00958ef6e;
    stim[53] = 65'h018dbe20703f6d64d;
    stim[54] = 65'h170c49141dec88b94;
    stim[55] = 65'h1c510cf364af9567d;
    stim[56] = 65'h00753591c8ee9de77;
    stim[57] = 65'h0a5b4629b78ba5e2d;
    stim[58] = 65'h028f06dca4fa6103b;
    stim[59] = 65'h12adbe68eb04cadcd;
    stim[60] = 65'h09b27bf7e18def0cc;
    stim[61] = 65'h0e26fdda92403d5a8;
    stim[62] = 65'h0359fe730c1674a5c;
    stim[63] = 65'h04be0f506e96d0978;
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
      expv[0] = 32'h2a0428f3;
      expv[1] = 32'hc4eed3e9;
      expv[2] = 32'h539eed47;
      expv[3] = 32'h1158ba5b;
      expv[4] = 32'h4144817b;
      expv[5] = 32'h3efacb01;
      expv[6] = 32'h8a67a8fb;
      expv[7] = 32'h481e20ed;
      expv[8] = 32'h61b65fe2;
      expv[9] = 32'he49e213f;
      expv[10] = 32'h7a4bd7e2;
      expv[11] = 32'h0a1b5362;
      expv[12] = 32'h6e3f384c;
      expv[13] = 32'h0acfa680;
      expv[14] = 32'ha531011f;
      expv[15] = 32'hf227fcf8;
      expv[16] = 32'h232a678e;
      expv[17] = 32'hb82a127c;
      expv[18] = 32'h434be4b7;
      expv[19] = 32'ha5a5ec95;
      expv[20] = 32'hcb8c711f;
      expv[21] = 32'h891ec614;
      expv[22] = 32'h9e5e1d1a;
      expv[23] = 32'hb25078e1;
      expv[24] = 32'hcac4b217;
      expv[25] = 32'h3d4a80af;
      expv[26] = 32'h75a4ec44;
      expv[27] = 32'he41ace92;
      expv[28] = 32'hf317066c;
      expv[29] = 32'h02d7f8e6;
      expv[30] = 32'hd33eef80;
      expv[31] = 32'h91126d2b;
      expv[32] = 32'h950125b8;
      expv[33] = 32'h4b48a9f3;
      expv[34] = 32'hf45570e4;
      expv[35] = 32'hc6724d10;
      expv[36] = 32'h8384176f;
      expv[37] = 32'h1be75242;
      expv[38] = 32'h70dc3000;
      expv[39] = 32'hcca7290b;
      expv[40] = 32'h1d271c04;
      expv[41] = 32'h4ded81b7;
      expv[42] = 32'h58798ecf;
      expv[43] = 32'h39af2816;
      expv[44] = 32'h68f6d2f0;
      expv[45] = 32'h0ad808a2;
      expv[46] = 32'h68aa1e19;
      expv[47] = 32'he9f1ba71;
      expv[48] = 32'h6edfca9c;
      expv[49] = 32'h104c8a81;
      expv[50] = 32'h9ef313a9;
      expv[51] = 32'h5160c977;
      expv[52] = 32'hafb501a0;
      expv[53] = 32'h18dbe207;
      expv[54] = 32'hdec88b94;
      expv[55] = 32'h4af9567d;
      expv[56] = 32'h0753591c;
      expv[57] = 32'ha5b4629b;
      expv[58] = 32'h28f06dca;
      expv[59] = 32'hb04cadcd;
      expv[60] = 32'h9b27bf7e;
      expv[61] = 32'he26fdda9;
      expv[62] = 32'h359fe730;
      expv[63] = 32'h4be0f506;
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
