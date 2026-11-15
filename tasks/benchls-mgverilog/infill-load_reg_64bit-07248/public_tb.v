// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07248 dut (
    .clk(clk),
    .ld(in_vec[64:64]),
    .d(in_vec[63:0]),
    .q(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h18afcb0425e93ec32;
    stim[1] = 65'h039572ae19d2de1a9;
    stim[2] = 65'h1fd87d23790e9a113;
    stim[3] = 65'h0b9c8f469547fe386;
    stim[4] = 65'h1420a431fbc658d9b;
    stim[5] = 65'h0d4767ecdb40c3c1b;
    stim[6] = 65'h1f9f34e79a97fc0f2;
    stim[7] = 65'h145c769db401a7cf6;
    stim[8] = 65'h111e7b653e73e6e71;
    stim[9] = 65'h08e1b326003dd84f0;
    stim[10] = 65'h104feec792b456975;
    stim[11] = 65'h0cdc662213f3fb36d;
    stim[12] = 65'h04a68822671599dcd;
    stim[13] = 65'h150b4b525b084ce96;
    stim[14] = 65'h11ffed5f777ddc774;
    stim[15] = 65'h1f450f627f82ca7a1;
    stim[16] = 65'h062606e2b84e68cbe;
    stim[17] = 65'h0e36021eb8ba8169b;
    stim[18] = 65'h0c0060437da257d5a;
    stim[19] = 65'h0f091deabc800086c;
    stim[20] = 65'h03198edfdf51ea41a;
    stim[21] = 65'h02d52fe3f2f291037;
    stim[22] = 65'h1f89a535e2950b2b2;
    stim[23] = 65'h0906fca44942ab875;
    stim[24] = 65'h09a8c0176c10b35a6;
    stim[25] = 65'h0dd95e9a7ec4a2798;
    stim[26] = 65'h0f1d8c8ceb401475e;
    stim[27] = 65'h1ad4100fc36a49396;
    stim[28] = 65'h09d8321fe97f3b340;
    stim[29] = 65'h16ca7f9ccaeb4399d;
    stim[30] = 65'h13452bc2d013f4603;
    stim[31] = 65'h0b268fc5288144770;
    stim[32] = 65'h1e503f23089390edd;
    stim[33] = 65'h0efdaae866ff5549a;
    stim[34] = 65'h18834d6ffaef2c792;
    stim[35] = 65'h11a71371f319bcb92;
    stim[36] = 65'h0e326a36e661ed6db;
    stim[37] = 65'h15ecde0092dca0be9;
    stim[38] = 65'h01dfab868ee6c4840;
    stim[39] = 65'h0b08477f053429490;
    stim[40] = 65'h1902b94e818a3c202;
    stim[41] = 65'h1ddc38c5a6115ed4e;
    stim[42] = 65'h097edb0382109db56;
    stim[43] = 65'h16b7967153caf19f9;
    stim[44] = 65'h188e1e11e30881052;
    stim[45] = 65'h00c1e2ce2c58e7942;
    stim[46] = 65'h0220232dc470ab6a0;
    stim[47] = 65'h0b859002d2f73c665;
    stim[48] = 65'h1ea0bc3155d03d0ea;
    stim[49] = 65'h0c561a4321d6f109c;
    stim[50] = 65'h04ec416886e4d6bb8;
    stim[51] = 65'h043632e18c6a5c5a4;
    stim[52] = 65'h0d09694133bf5af8c;
    stim[53] = 65'h1f1d2d6f368d6bd5a;
    stim[54] = 65'h0050f1ceb4f207d12;
    stim[55] = 65'h1a348022f10417f81;
    stim[56] = 65'h1d6bad625bcb3b92d;
    stim[57] = 65'h010c7c22937721e7e;
    stim[58] = 65'h044ca15b546fb26ec;
    stim[59] = 65'h0c75e0dce42ddf4e5;
    stim[60] = 65'h02bd66bdea91704a0;
    stim[61] = 65'h154485d9889401464;
    stim[62] = 65'h1a4d8019c982ef12f;
    stim[63] = 65'h129da271153d9d977;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'h8afcb0425e93ec32;
      expv[2] = 64'h8afcb0425e93ec32;
      expv[3] = 64'hfd87d23790e9a113;
      expv[4] = 64'hfd87d23790e9a113;
      expv[5] = 64'h420a431fbc658d9b;
      expv[6] = 64'h420a431fbc658d9b;
      expv[7] = 64'hf9f34e79a97fc0f2;
      expv[8] = 64'h45c769db401a7cf6;
      expv[9] = 64'h11e7b653e73e6e71;
      expv[10] = 64'h11e7b653e73e6e71;
      expv[11] = 64'h04feec792b456975;
      expv[12] = 64'h04feec792b456975;
      expv[13] = 64'h04feec792b456975;
      expv[14] = 64'h50b4b525b084ce96;
      expv[15] = 64'h1ffed5f777ddc774;
      expv[16] = 64'hf450f627f82ca7a1;
      expv[17] = 64'hf450f627f82ca7a1;
      expv[18] = 64'hf450f627f82ca7a1;
      expv[19] = 64'hf450f627f82ca7a1;
      expv[20] = 64'hf450f627f82ca7a1;
      expv[21] = 64'hf450f627f82ca7a1;
      expv[22] = 64'hf450f627f82ca7a1;
      expv[23] = 64'hf89a535e2950b2b2;
      expv[24] = 64'hf89a535e2950b2b2;
      expv[25] = 64'hf89a535e2950b2b2;
      expv[26] = 64'hf89a535e2950b2b2;
      expv[27] = 64'hf89a535e2950b2b2;
      expv[28] = 64'had4100fc36a49396;
      expv[29] = 64'had4100fc36a49396;
      expv[30] = 64'h6ca7f9ccaeb4399d;
      expv[31] = 64'h3452bc2d013f4603;
      expv[32] = 64'h3452bc2d013f4603;
      expv[33] = 64'he503f23089390edd;
      expv[34] = 64'he503f23089390edd;
      expv[35] = 64'h8834d6ffaef2c792;
      expv[36] = 64'h1a71371f319bcb92;
      expv[37] = 64'h1a71371f319bcb92;
      expv[38] = 64'h5ecde0092dca0be9;
      expv[39] = 64'h5ecde0092dca0be9;
      expv[40] = 64'h5ecde0092dca0be9;
      expv[41] = 64'h902b94e818a3c202;
      expv[42] = 64'hddc38c5a6115ed4e;
      expv[43] = 64'hddc38c5a6115ed4e;
      expv[44] = 64'h6b7967153caf19f9;
      expv[45] = 64'h88e1e11e30881052;
      expv[46] = 64'h88e1e11e30881052;
      expv[47] = 64'h88e1e11e30881052;
      expv[48] = 64'h88e1e11e30881052;
      expv[49] = 64'hea0bc3155d03d0ea;
      expv[50] = 64'hea0bc3155d03d0ea;
      expv[51] = 64'hea0bc3155d03d0ea;
      expv[52] = 64'hea0bc3155d03d0ea;
      expv[53] = 64'hea0bc3155d03d0ea;
      expv[54] = 64'hf1d2d6f368d6bd5a;
      expv[55] = 64'hf1d2d6f368d6bd5a;
      expv[56] = 64'ha348022f10417f81;
      expv[57] = 64'hd6bad625bcb3b92d;
      expv[58] = 64'hd6bad625bcb3b92d;
      expv[59] = 64'hd6bad625bcb3b92d;
      expv[60] = 64'hd6bad625bcb3b92d;
      expv[61] = 64'hd6bad625bcb3b92d;
      expv[62] = 64'h54485d9889401464;
      expv[63] = 64'ha4d8019c982ef12f;
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
