// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 80;
  localparam OW = 97;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_220933 dut (
    .clk(clk),
    .rst(in_vec[79:79]),
    .mfc0(in_vec[78:78]),
    .mtc0(in_vec[77:77]),
    .pc(in_vec[76:45]),
    .Rd(in_vec[44:40]),
    .wdata(in_vec[39:8]),
    .exception(in_vec[7:7]),
    .eret(in_vec[6:6]),
    .cause(in_vec[5:1]),
    .intr(in_vec[0:0]),
    .rdata(out_vec[96:65]),
    .status(out_vec[64:33]),
    .timer_int(out_vec[32:32]),
    .exc_addr(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 80'h85a640e49529279a8a00;
    stim[1] = 80'h82bda0e612a00bff1133;
    stim[2] = 80'h153975cc3272b964f9b7;
    stim[3] = 80'h5224bde59ed78315f8ca;
    stim[4] = 80'h47775f31c4c66d2b46c2;
    stim[5] = 80'h53d9691d936f3d5981dd;
    stim[6] = 80'h53d8069d8b67c6d199ff;
    stim[7] = 80'h421fa4ea93c93152623f;
    stim[8] = 80'h152c2acc0b4241c80842;
    stim[9] = 80'h13b3c16f379f2a8f5f55;
    stim[10] = 80'h1592873113798d4db6c4;
    stim[11] = 80'h3e8c3d0949a594564174;
    stim[12] = 80'h5a33bb8732ad0bb15bda;
    stim[13] = 80'h783425ca6450b8d2bcec;
    stim[14] = 80'h40667c544cd141d0d248;
    stim[15] = 80'h5b0eff431ac8204cb071;
    stim[16] = 80'h7b668ed6327800d74b46;
    stim[17] = 80'h5bb220b8e23bd888b563;
    stim[18] = 80'h91c84d6f9cd4217ff9e9;
    stim[19] = 80'h3941ea3f612d047dc016;
    stim[20] = 80'h072ca260fbe14b4f860d;
    stim[21] = 80'h1a875661bff5cb0b2ec3;
    stim[22] = 80'h562a0ca85e836627f4fb;
    stim[23] = 80'h116c2a83b6360ce7f9ff;
    stim[24] = 80'h05682561cb72180f7e23;
    stim[25] = 80'h7ef80e4afb555eb14311;
    stim[26] = 80'h6d58815fee8a93a91551;
    stim[27] = 80'h4c63601ff351c31a4f60;
    stim[28] = 80'h0a66bbb7638b5e63b33e;
    stim[29] = 80'h35224b77ccf696b7eebc;
    stim[30] = 80'h2b44ee498194e5f9d0a3;
    stim[31] = 80'h5585a1698b66900e57c4;
    stim[32] = 80'h373f079fdcb5cc70871b;
    stim[33] = 80'h083699a75f7bb34fc8b8;
    stim[34] = 80'h06761be239efeb8ebcb5;
    stim[35] = 80'h52b5e58f21da3c194b82;
    stim[36] = 80'h6bac3dbfc352ee43305b;
    stim[37] = 80'h751c28355fb60957d371;
    stim[38] = 80'h4f9f76243770435ca144;
    stim[39] = 80'h43ec0ec69b55c0a1fe43;
    stim[40] = 80'h07c4e3f81637ab33ac78;
    stim[41] = 80'h110b655501f39cd50b73;
    stim[42] = 80'h4b90c9a2cb9db178026a;
    stim[43] = 80'h0f73b08ffa5f0308a478;
    stim[44] = 80'h6a6d15dafae855f523ec;
    stim[45] = 80'h63764506beefe1fcc3aa;
    stim[46] = 80'h5d9ab0ed6ff182a0ce43;
    stim[47] = 80'h0581afa9e6db08388f80;
    stim[48] = 80'h4740ad57586b473cad36;
    stim[49] = 80'h7561b054a539ff5ca7f1;
    stim[50] = 80'h03d2748828ceb0dab062;
    stim[51] = 80'h86569579fcd4f25eef8d;
    stim[52] = 80'h24bfa2bc1c8bf6bfd517;
    stim[53] = 80'h53e5576113037c13e11e;
    stim[54] = 80'h6d8874cdcd31c9f874eb;
    stim[55] = 80'h5844f3daa87c8a8de8b8;
    stim[56] = 80'h65b50e93edd79cd3e273;
    stim[57] = 80'h49e8c02be06332d7ec6d;
    stim[58] = 80'h1efaa5465681cd7a1813;
    stim[59] = 80'h278a0dd1853524470155;
    stim[60] = 80'h214608e31fe785b6837c;
    stim[61] = 80'h3d61a0c4096e13a8966e;
    stim[62] = 80'h73c179844edb3601fd8f;
    stim[63] = 80'h4513eb4e230e2c61a340;
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
      expv[0] = 97'h0000000000000001f00000000;
      expv[1] = 97'h0000000000000001f00000000;
      expv[2] = 97'h0000000000000001f00400004;
      expv[3] = 97'h0000000000000001d00000000;
      expv[4] = 97'h0000000000000001f00400004;
      expv[5] = 97'h0000000000000001f00400004;
      expv[6] = 97'h0000000000000001f00400004;
      expv[7] = 97'h0000000000000001f00000000;
      expv[8] = 97'h0000000000000001f00000000;
      expv[9] = 97'h0000000000000001f00000000;
      expv[10] = 97'h0000000000000001f00400004;
      expv[11] = 97'h0000000000000001f00000000;
      expv[12] = 97'h0000000000000001f00400004;
      expv[13] = 97'h0000000000000001f00400004;
      expv[14] = 97'h00000001e0000001f00000000;
      expv[15] = 97'h0000000000000001f00000000;
      expv[16] = 97'h0000000000000001f00000000;
      expv[17] = 97'h0000000000000001f00000000;
      expv[18] = 97'h0000000000000001f00400004;
      expv[19] = 97'h0000000000000001f00000000;
      expv[20] = 97'h0000000000000001f00000000;
      expv[21] = 97'h0000000000000001f00400004;
      expv[22] = 97'h0000000000000001f00400004;
      expv[23] = 97'h0000000000000001f00400004;
      expv[24] = 97'h0000000000000001f00000000;
      expv[25] = 97'h0000000000000001f00000000;
      expv[26] = 97'h116c2a83a0000001f00000000;
      expv[27] = 97'h0000000000000001f00000000;
      expv[28] = 97'h0000000000000001f00000000;
      expv[29] = 97'h00000001e0000001f00400004;
      expv[30] = 97'h05a08fb81ed2d6fdd00000000;
      expv[31] = 97'h000000001ed2d6fdd00000000;
      expv[32] = 97'h000000001ed2d6fdf00000000;
      expv[33] = 97'h000000001ed2d6fdf00400004;
      expv[34] = 97'h000000001ed2d6fdd00000000;
      expv[35] = 97'h129cbf3a1ed2d6fdd00000000;
      expv[36] = 97'h000000001ed2d6fdd00000000;
      expv[37] = 97'h000000001ed2d6fdf00000000;
      expv[38] = 97'h000000001ed2d6fdf00000000;
      expv[39] = 97'h0aabd6287ed2d6fdf00000000;
      expv[40] = 97'h000000001ed2d6fdf00000000;
      expv[41] = 97'h129cbf3a1ed2d6fdf00000000;
      expv[42] = 97'h000000001ed2d6fdf00000000;
      expv[43] = 97'h000000001ed2d6fdf00000000;
      expv[44] = 97'h000000001ed2d6fdf00400004;
      expv[45] = 97'h000000001ed2d6fdf00400004;
      expv[46] = 97'h000000001ed2d6fdd00000000;
      expv[47] = 97'h000000001ed2d6fdf00400004;
      expv[48] = 97'h000000001ed2d6fdd00000000;
      expv[49] = 97'h000000001ed2d6fdd00000000;
      expv[50] = 97'h000000001ed2d6fdf00000000;
      expv[51] = 97'h0000000000000001f00400004;
      expv[52] = 97'h0000000000000001f00000000;
      expv[53] = 97'h0000000000000001f00000000;
      expv[54] = 97'h0000000000000001f00400004;
      expv[55] = 97'h0000000000000001f00400004;
      expv[56] = 97'h06393f0e80000001d00000000;
      expv[57] = 97'h0000000000000001f00000000;
      expv[58] = 97'h0000000000000001f00000000;
      expv[59] = 97'h0000000000000001f00000000;
      expv[60] = 97'h0000000000000001f00000000;
      expv[61] = 97'h0000000000000001f00000000;
      expv[62] = 97'h1844f3daa0000001f00400004;
      expv[63] = 97'h0000000000000001d00000000;
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
