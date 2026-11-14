// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  gearbox_66b64b dut (
    .clk(clk),
    .reset(in_vec[67:67]),
    .i_data(in_vec[66:1]),
    .i_valid(in_vec[0:0]),
    .o_data(out_vec[64:1]),
    .o_rd_en(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hc236eb8705aacec5b;
    stim[1] = 68'hd4b2b39c09a7ff15b;
    stim[2] = 68'h5fae0c9a16eda80d2;
    stim[3] = 68'h28daab3265e8570ce;
    stim[4] = 68'h403e4a0f4b6d4f9d0;
    stim[5] = 68'h76a7f9a7676967dce;
    stim[6] = 68'h6089f194ed113e89f;
    stim[7] = 68'h65c1df5959c2e60ba;
    stim[8] = 68'h34cfc65e009c4c94e;
    stim[9] = 68'h2d814d4fc593fbe98;
    stim[10] = 68'h44b7c5a9e9bdf6bf4;
    stim[11] = 68'h1ae00e5e3f07bafa9;
    stim[12] = 68'h4af16426c4f9fc3b1;
    stim[13] = 68'h70c37011890a8d7fd;
    stim[14] = 68'h4f5ea4ca871bccfb8;
    stim[15] = 68'h3f4be784c60a85360;
    stim[16] = 68'h59d3e7fae40e4551d;
    stim[17] = 68'h131dc33279ecd1114;
    stim[18] = 68'h5b9f2d8680786b0bd;
    stim[19] = 68'h65e8c95587dbf2767;
    stim[20] = 68'h39c23a11d974c2954;
    stim[21] = 68'h420fe42c8d2bd9694;
    stim[22] = 68'h516e7b73eea231558;
    stim[23] = 68'h4d12cc1c32f00d62d;
    stim[24] = 68'h00035ee7955e8f7b4;
    stim[25] = 68'h0b6610c977d674052;
    stim[26] = 68'h09541b61765f08b59;
    stim[27] = 68'h7405a66fd4938d8c3;
    stim[28] = 68'h542ff105f39ce52f1;
    stim[29] = 68'hf950810d6a1266a51;
    stim[30] = 68'h6d5f2d1a429a62302;
    stim[31] = 68'h41b7c822faf29c48e;
    stim[32] = 68'h5fd262115efff4d0e;
    stim[33] = 68'h10f16290b746e201e;
    stim[34] = 68'h3f01110e00c721935;
    stim[35] = 68'h30e615eaeb2655e09;
    stim[36] = 68'h15b3a67e33a628238;
    stim[37] = 68'h0b9dc0ef6cbff3d82;
    stim[38] = 68'h774768bd2fb617a1a;
    stim[39] = 68'h2a5456b888302dfe7;
    stim[40] = 68'h645c6cff729dba6a3;
    stim[41] = 68'h57d7eb610ed2ac92e;
    stim[42] = 68'h6d49611a418300fa2;
    stim[43] = 68'h4f07f4068fd0d7198;
    stim[44] = 68'h0808289bec9b8ac0b;
    stim[45] = 68'h0251bc280cf677f0b;
    stim[46] = 68'h41cba742004f79197;
    stim[47] = 68'h4b3e48eb39c877257;
    stim[48] = 68'h528a938adb9282473;
    stim[49] = 68'h3fa934110b0ac9b74;
    stim[50] = 68'h15bc2e142be1bbdca;
    stim[51] = 68'h40e3a28eceebfd640;
    stim[52] = 68'h2b5409cc79c88e57a;
    stim[53] = 68'h25df732d2d8e3eb3f;
    stim[54] = 68'h5fa809d3d9f78badf;
    stim[55] = 68'h40748d9de55b7068d;
    stim[56] = 68'h4d55051b3c071913c;
    stim[57] = 68'h7402cb4146f1f05fb;
    stim[58] = 68'h1031f014550485560;
    stim[59] = 68'h09a2605a3cc02b792;
    stim[60] = 68'h380b7295552485508;
    stim[61] = 68'h53669f3430acbf077;
    stim[62] = 68'h5ee3e182ed272fd41;
    stim[63] = 68'h20777a91e6409bcf3;
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
      expv[0] = 65'hxxxxxxxxxxxxxxxxx;
      expv[1] = 65'hxxxxxxxxxxxxxxxxx;
      expv[2] = 65'h14b2b39c09a7ff15b;
      expv[3] = 65'h1fae0c9a16eda80d3;
      expv[4] = 65'h036aacc997a15c33d;
      expv[5] = 65'h03e4a0f4b6d4f9d15;
      expv[6] = 65'h09fe69d9da59f73d5;
      expv[7] = 65'h09f194ed113e89f53;
      expv[8] = 65'h077d65670b982ee09;
      expv[9] = 65'h1c65e009c4c94f823;
      expv[10] = 65'h1353f164fefa66089;
      expv[11] = 65'h05a9e9bdf6bf58227;
      expv[12] = 65'h1978fc1eebea6089f;
      expv[13] = 65'h026c4f9fc3b06b803;
      expv[14] = 65'h046242a35ff4af165;
      expv[15] = 65'h0a871bccfb9c30dc1;
      expv[16] = 65'h13182a14d870c3701;
      expv[17] = 65'h0e40e4551dc30dc05;
      expv[18] = 65'h1e7b3444559d3e7fb;
      expv[19] = 65'h00786b0bd674f9feb;
      expv[20] = 65'h1f6fc9d9db9f2d869;
      expv[21] = 65'h174c295597a325561;
      expv[22] = 65'h0af65a565e8c95587;
      expv[23] = 65'h023155997a325561f;
      expv[24] = 65'h00358b65e8c95587d;
      expv[25] = 65'h08f7b5344b3070cbd;
      expv[26] = 65'h1d014cd12cc1c32f1;
      expv[27] = 65'h08b59344b3070cbc1;
      expv[28] = 65'h163089541b61765f1;
      expv[29] = 65'h12f1d01699bf524e3;
      expv[30] = 65'h094542ff105f39ce5;
      expv[31] = 65'h0d5f2d1a429a62303;
      expv[32] = 65'h06df208bebca7123f;
      expv[33] = 65'h1d262115efff4d0ff;
      expv[34] = 65'h1c58a42dd1b8807f9;
      expv[35] = 65'h01110e00c721935e5;
      expv[36] = 65'h1857abac9957823f1;
      expv[37] = 65'h1a67e33a628238c39;
      expv[38] = 65'h103bdb2ffcf60b0e7;
      expv[39] = 65'h08bd2fb617a1ac399;
      expv[40] = 65'h1ae220c0b7f9b0e61;
      expv[41] = 65'h0ff729dba6a2a9515;
      expv[42] = 65'h1843b4ab24be45c6d;
      expv[43] = 65'h1a418300fa39171b3;
      expv[44] = 65'h1a3f435c66645c6cf;
      expv[45] = 65'h1ec9b8ac0b9171b3f;
      expv[46] = 65'h033d9dfc28808289b;
      expv[47] = 65'h004f791960946f0a1;
      expv[48] = 65'h0721dc95c1cba7421;
      expv[49] = 65'h192824732cf923acf;
      expv[50] = 65'h02b26dd528a938adb;
      expv[51] = 65'h01bbdcb4a2a4e2b6f;
      expv[52] = 65'h0ff590528a938adb9;
      expv[53] = 65'h08e57b4a2a4e2b6e5;
      expv[54] = 65'h0facfd28a938adb93;
      expv[55] = 65'h0bade977dccb4b639;
      expv[56] = 65'h01a35fa809d3d9f79;
      expv[57] = 65'h113d01d23677956dd;
      expv[58] = 65'h17ec0748d9de55b71;
      expv[59] = 65'h161d00b2d051bc7c1;
      expv[60] = 65'h04f402cb4146f1f05;
      expv[61] = 65'h09d00b2d051bc7c17;
      expv[62] = 65'h1f402cb4146f1f05e;
      expv[63] = 65'h14d9a7cd0c2b2fc1d;
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
