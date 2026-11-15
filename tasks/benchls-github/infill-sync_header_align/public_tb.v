// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  sync_header_align dut (
    .clk(clk),
    .reset(in_vec[67:67]),
    .i_data(in_vec[66:1]),
    .i_slip_done(in_vec[0:0]),
    .i_slip(out_vec[67:67]),
    .o_data(out_vec[66:3]),
    .o_header(out_vec[2:1]),
    .o_block_sync(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hae0c70cfc7f92dcf2;
    stim[1] = 68'hf9f7a6b3a438144e4;
    stim[2] = 68'h4362f6f7bba84dd6f;
    stim[3] = 68'h46a6adb8338286ef0;
    stim[4] = 68'h62db270d010cb96f3;
    stim[5] = 68'h40ddf1b1c5aaf486e;
    stim[6] = 68'h673a98294adf1bbf0;
    stim[7] = 68'h49beb36fb69a6f91c;
    stim[8] = 68'h11113fc08fadac218;
    stim[9] = 68'h1803b5c306ac35303;
    stim[10] = 68'h77253caf5404ea157;
    stim[11] = 68'h2108dd7184342f95a;
    stim[12] = 68'h1126da1f163093c6c;
    stim[13] = 68'h107408d45245144f3;
    stim[14] = 68'h60e808ee62a655d46;
    stim[15] = 68'h79000735ab7e8d907;
    stim[16] = 68'h22e1a2a696b1504d2;
    stim[17] = 68'h263586c9726b70393;
    stim[18] = 68'h444bbd8358d6cb57f;
    stim[19] = 68'h15f211355eee1a0c4;
    stim[20] = 68'h2f105c19ddf239bd4;
    stim[21] = 68'h1b9dad44b9fff407c;
    stim[22] = 68'h12b044dc48ef0e90a;
    stim[23] = 68'h5245cd4264c443fb0;
    stim[24] = 68'h194bd0dfb046270ff;
    stim[25] = 68'h4d7c881e980b0de36;
    stim[26] = 68'h7a9de052e6f6b3e42;
    stim[27] = 68'h793fb7ffa18209d7f;
    stim[28] = 68'h7f20b636f0538bf02;
    stim[29] = 68'h53f22d0725f09be6c;
    stim[30] = 68'h32054c97ef4d6dd3f;
    stim[31] = 68'h3d488c8cca59a0824;
    stim[32] = 68'h00275c8a31b809fb6;
    stim[33] = 68'h43ecd67f5da46f6bd;
    stim[34] = 68'h2665cc8fff014cf9b;
    stim[35] = 68'h0d5337313f1921783;
    stim[36] = 68'h2ffb49bfb95484428;
    stim[37] = 68'h53172ca41ba01b82f;
    stim[38] = 68'h2f99d8e627c6374a2;
    stim[39] = 68'h76cfd3fa7bb256990;
    stim[40] = 68'h7eeeb471a66366a42;
    stim[41] = 68'h0dfaa82d2e59b51b6;
    stim[42] = 68'h69196a12524dab438;
    stim[43] = 68'h58aedc3967e46809a;
    stim[44] = 68'h22f317884df3d2986;
    stim[45] = 68'h29b2e2087a7900ef2;
    stim[46] = 68'h48363ffdc78f7aa6d;
    stim[47] = 68'h2e64af5aa6fdb3168;
    stim[48] = 68'h72056d7df7164e0fe;
    stim[49] = 68'h36c717fa90096ce98;
    stim[50] = 68'h2115afe894cf9c340;
    stim[51] = 68'h178a15da7383cbd17;
    stim[52] = 68'h6e890b790d8828106;
    stim[53] = 68'h5913120b5675745fc;
    stim[54] = 68'h34721378e2149e1ad;
    stim[55] = 68'h2ef8a516ec7485834;
    stim[56] = 68'h51a5ae8c78ea11aaf;
    stim[57] = 68'h4faa6432175767e0e;
    stim[58] = 68'h7706f12eebccba737;
    stim[59] = 68'h4da3bd51b227bd2d7;
    stim[60] = 68'h51b1aedd88a5911a7;
    stim[61] = 68'h1972199fbdd387724;
    stim[62] = 68'h6e529a34616bd32b4;
    stim[63] = 68'h61c093f8a8b53878d;
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
      expv[0] = 68'h3831c33f1fe4b73ca;
      expv[1] = 68'h67de9ace90e051396;
      expv[2] = 68'h0d8bdbdeeea1375bc;
      expv[3] = 68'h1a9ab6e0ce0a1bbc4;
      expv[4] = 68'h0b6c9c340432e5bce;
      expv[5] = 68'h8377c6c716abd21bc;
      expv[6] = 68'h9cea60a52b7c6efc6;
      expv[7] = 68'ha6facdbeda69be474;
      expv[8] = 68'hc444ff023eb6b0860;
      expv[9] = 68'he00ed70c1ab0d4c08;
      expv[10] = 68'h5c94f2bd5013a855e;
      expv[11] = 68'h842375c610d0be56a;
      expv[12] = 68'hc49b687c58c24f1b0;
      expv[13] = 68'hc1d023514914513c8;
      expv[14] = 68'h03a023b98a995751e;
      expv[15] = 68'he4001cd6adfa3641e;
      expv[16] = 68'h0b868a9a5ac54134a;
      expv[17] = 68'h18d61b25c9adc0e4a;
      expv[18] = 68'h112ef60d635b2d5fc;
      expv[19] = 68'h57c844d57bb868310;
      expv[20] = 68'hbc41706777c8e6f52;
      expv[21] = 68'hee76b512e7ffd01f0;
      expv[22] = 68'hcac1137123bc3a428;
      expv[23] = 68'hc917350993110fec4;
      expv[24] = 68'he52f437ec1189c3f8;
      expv[25] = 68'h35f2207a602c378dc;
      expv[26] = 68'h6a77814b9bdacf90e;
      expv[27] = 68'he4fedffe8608275fe;
      expv[28] = 68'h7c82d8dbc14e2fc0e;
      expv[29] = 68'hcfc8b41c97c26f9b4;
      expv[30] = 68'hc815325fbd35b74fa;
      expv[31] = 68'h75223233296682092;
      expv[32] = 68'h009d7228c6e027ed8;
      expv[33] = 68'h8fb359fd7691bdaf4;
      expv[34] = 68'h1997323ffc0533e6a;
      expv[35] = 68'h354cdcc4fc6485e08;
      expv[36] = 68'hbfed26fee552110a2;
      expv[37] = 68'hcc5cb2906e806e0bc;
      expv[38] = 68'h3e6763989f18dd28a;
      expv[39] = 68'h5b3f4fe9eec95a646;
      expv[40] = 68'hfbbad1c6998d9a90e;
      expv[41] = 68'hb7eaa0b4b966d46d8;
      expv[42] = 68'ha465a8494936ad0e6;
      expv[43] = 68'he2bb70e59f91a026c;
      expv[44] = 68'h8bcc5e2137cf4a61a;
      expv[45] = 68'ha6cb8821e9e403bca;
      expv[46] = 68'ha0d8fff71e3dea9b4;
      expv[47] = 68'h3992bd6a9bf6cc5a2;
      expv[48] = 68'h4815b5f7dc59383fe;
      expv[49] = 68'hdb1c5fea4025b3a62;
      expv[50] = 68'h8456bfa2533e70d02;
      expv[51] = 68'hde285769ce0f2f458;
      expv[52] = 68'h3a242de43620a041e;
      expv[53] = 68'he44c482d59d5d17f4;
      expv[54] = 68'hd1c84de38852786b2;
      expv[55] = 68'h3be2945bb1d2160d2;
      expv[56] = 68'h4696ba31e3a846abc;
      expv[57] = 68'h3ea990c85d5d9f83c;
      expv[58] = 68'h5c1bc4bbaf32e9cde;
      expv[59] = 68'hb68ef546c89ef4b5c;
      expv[60] = 68'h46c6bb7622964469c;
      expv[61] = 68'h65c8667ef74e1dc90;
      expv[62] = 68'hb94a68d185af4cad6;
      expv[63] = 68'h87024fe2a2d4e1e36;
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
