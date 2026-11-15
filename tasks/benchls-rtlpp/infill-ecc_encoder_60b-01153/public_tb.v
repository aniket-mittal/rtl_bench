// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 60;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01153 dut (
    .din(in_vec[59:0]),
    .dout(out_vec[67:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 60'h9da37d5cedad53d;
    stim[1] = 60'h3e14923601933bb;
    stim[2] = 60'hd34f7062fa274b6;
    stim[3] = 60'h2d1e55d4fbc2bf0;
    stim[4] = 60'h800278769465916;
    stim[5] = 60'h9815ae9e08b7b3f;
    stim[6] = 60'he252d4f9da3a13b;
    stim[7] = 60'h3779220aaaa5990;
    stim[8] = 60'hcb4de641794028a;
    stim[9] = 60'hb0c778445466e3d;
    stim[10] = 60'h88c2408787fb518;
    stim[11] = 60'h5f11fa230008c8a;
    stim[12] = 60'h0279684cc377449;
    stim[13] = 60'hc90a6fdc343da95;
    stim[14] = 60'h8c5589c3ba0a098;
    stim[15] = 60'h1a7a90e3a041ef5;
    stim[16] = 60'h1f9e3c4a5033b66;
    stim[17] = 60'h1fdbd09eb94ded5;
    stim[18] = 60'hea963574362dab3;
    stim[19] = 60'h602abf2a2470dfd;
    stim[20] = 60'h7a50a59d1f0ce4d;
    stim[21] = 60'h5f099b4b6a005f6;
    stim[22] = 60'h5d81d59d6479d1e;
    stim[23] = 60'hdd7cba199f79042;
    stim[24] = 60'h474ec2c3891c6f3;
    stim[25] = 60'h86006ee824f5601;
    stim[26] = 60'h8f46787e4d73108;
    stim[27] = 60'hb33205071a24990;
    stim[28] = 60'h8c38ab0437130aa;
    stim[29] = 60'h3d773851ec05540;
    stim[30] = 60'haecd12238b3ec55;
    stim[31] = 60'hba384061093c170;
    stim[32] = 60'h02dbab71820d6e0;
    stim[33] = 60'h94104474b02de27;
    stim[34] = 60'h6773f08824ae19f;
    stim[35] = 60'h0b705317816e71e;
    stim[36] = 60'h61d6c6b0c781fc4;
    stim[37] = 60'h82ca49d4464f587;
    stim[38] = 60'h513f282403cfd46;
    stim[39] = 60'h26483bab9839e0f;
    stim[40] = 60'hea097761b687f57;
    stim[41] = 60'hfa43c4dc552d5f6;
    stim[42] = 60'hde07006b42c1fd7;
    stim[43] = 60'h3415304145b811c;
    stim[44] = 60'hd6803c16a9a3cce;
    stim[45] = 60'hfa915d5df353705;
    stim[46] = 60'h20c7da0cb6d4ad0;
    stim[47] = 60'h1a59f1020f440cc;
    stim[48] = 60'hb90d5c8374e3719;
    stim[49] = 60'h289b9642c6525a2;
    stim[50] = 60'hec58bd68b48cb39;
    stim[51] = 60'h5aa3af90ebafa10;
    stim[52] = 60'h73fbd0703c7b909;
    stim[53] = 60'h523fb474739c314;
    stim[54] = 60'h9d179899aafae70;
    stim[55] = 60'heb6b20eca4099bc;
    stim[56] = 60'h4f707dcff2155a7;
    stim[57] = 60'h685f4691e4c4e5f;
    stim[58] = 60'hb6768ab6000bc44;
    stim[59] = 60'h0f73d25e875f319;
    stim[60] = 60'h8e69b7537af522f;
    stim[61] = 60'h8b01f1b9a36c924;
    stim[62] = 60'hc14d41885002e73;
    stim[63] = 60'h3d10ff2065c8ffb;
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
      expv[0] = 68'h9da37d5cedad53d07;
      expv[1] = 68'h3e14923601933bb68;
      expv[2] = 68'hd34f7062fa274b611;
      expv[3] = 68'h2d1e55d4fbc2bf020;
      expv[4] = 68'h800278769465916b9;
      expv[5] = 68'h9815ae9e08b7b3f18;
      expv[6] = 68'he252d4f9da3a13bee;
      expv[7] = 68'h3779220aaaa599053;
      expv[8] = 68'hcb4de641794028a74;
      expv[9] = 68'hb0c778445466e3d5e;
      expv[10] = 68'h88c2408787fb518e3;
      expv[11] = 68'h5f11fa230008c8af1;
      expv[12] = 68'h0279684cc377449a5;
      expv[13] = 68'hc90a6fdc343da95e5;
      expv[14] = 68'h8c5589c3ba0a0986a;
      expv[15] = 68'h1a7a90e3a041ef5b7;
      expv[16] = 68'h1f9e3c4a5033b660a;
      expv[17] = 68'h1fdbd09eb94ded577;
      expv[18] = 68'hea963574362dab384;
      expv[19] = 68'h602abf2a2470dfde2;
      expv[20] = 68'h7a50a59d1f0ce4d41;
      expv[21] = 68'h5f099b4b6a005f69d;
      expv[22] = 68'h5d81d59d6479d1ecf;
      expv[23] = 68'hdd7cba199f7904253;
      expv[24] = 68'h474ec2c3891c6f3c2;
      expv[25] = 68'h86006ee824f560173;
      expv[26] = 68'h8f46787e4d73108a1;
      expv[27] = 68'hb33205071a24990f9;
      expv[28] = 68'h8c38ab0437130aa4b;
      expv[29] = 68'h3d773851ec0554068;
      expv[30] = 68'haecd12238b3ec55aa;
      expv[31] = 68'hba384061093c1705a;
      expv[32] = 68'h02dbab71820d6e0be;
      expv[33] = 68'h94104474b02de279c;
      expv[34] = 68'h6773f08824ae19f84;
      expv[35] = 68'h0b705317816e71ec3;
      expv[36] = 68'h61d6c6b0c781fc4a4;
      expv[37] = 68'h82ca49d4464f587fd;
      expv[38] = 68'h513f282403cfd4697;
      expv[39] = 68'h26483bab9839e0fa2;
      expv[40] = 68'hea097761b687f57c5;
      expv[41] = 68'hfa43c4dc552d5f65d;
      expv[42] = 68'hde07006b42c1fd7e9;
      expv[43] = 68'h3415304145b811c67;
      expv[44] = 68'hd6803c16a9a3cce95;
      expv[45] = 68'hfa915d5df35370527;
      expv[46] = 68'h20c7da0cb6d4ad043;
      expv[47] = 68'h1a59f1020f440cc6b;
      expv[48] = 68'hb90d5c8374e3719b8;
      expv[49] = 68'h289b9642c6525a223;
      expv[50] = 68'hec58bd68b48cb3976;
      expv[51] = 68'h5aa3af90ebafa10b3;
      expv[52] = 68'h73fbd0703c7b909dd;
      expv[53] = 68'h523fb474739c3145f;
      expv[54] = 68'h9d179899aafae7053;
      expv[55] = 68'heb6b20eca4099bc15;
      expv[56] = 68'h4f707dcff2155a74a;
      expv[57] = 68'h685f4691e4c4e5fbf;
      expv[58] = 68'hb6768ab6000bc44ab;
      expv[59] = 68'h0f73d25e875f319ea;
      expv[60] = 68'h8e69b7537af522f2a;
      expv[61] = 68'h8b01f1b9a36c924a2;
      expv[62] = 68'hc14d41885002e7360;
      expv[63] = 68'h3d10ff2065c8ffb70;
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
