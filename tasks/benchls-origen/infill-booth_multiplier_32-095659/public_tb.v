// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_095659 dut (
    .clk(clk),
    .reset(in_vec[65:65]),
    .a_in(in_vec[64:33]),
    .b_in(in_vec[32:1]),
    .start(in_vec[0:0]),
    .product(out_vec[64:1]),
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
    stim[0] = 66'h2f8cdfe151c8a5bc3;
    stim[1] = 66'h3e7b020d1ddde204c;
    stim[2] = 66'h0b8e21aa8ca955689;
    stim[3] = 66'h09208d15a9ff1ff39;
    stim[4] = 66'h3c44b55afbb18b7f6;
    stim[5] = 66'h12244c1bc086a23e2;
    stim[6] = 66'h0f0a1c72d572baa39;
    stim[7] = 66'h0f98dd40c1dc43308;
    stim[8] = 66'h1b7162dc02329583e;
    stim[9] = 66'h0786b11fb26516323;
    stim[10] = 66'h1d17b0b816ad844ba;
    stim[11] = 66'h0fda9894fe4b07741;
    stim[12] = 66'h01add5ab4c29a1e57;
    stim[13] = 66'h0205a9eb93d75e22c;
    stim[14] = 66'h14fedff1fc1fcafee;
    stim[15] = 66'h13e88415bbe64f594;
    stim[16] = 66'h0f577f13da3e38704;
    stim[17] = 66'h126894870401100c2;
    stim[18] = 66'h035e54322a5ea1e34;
    stim[19] = 66'h0e0787961add7198c;
    stim[20] = 66'h13ceedd58df06136a;
    stim[21] = 66'h0d592d63eed91f026;
    stim[22] = 66'h07cf3bd1961a335fe;
    stim[23] = 66'h0c55e1050b4365b60;
    stim[24] = 66'h1f8d227224876d5a1;
    stim[25] = 66'h078c0b1797959672a;
    stim[26] = 66'h1a8bf3d42b5a747bf;
    stim[27] = 66'h131dd2544a38af5c9;
    stim[28] = 66'h1331206cedfc89851;
    stim[29] = 66'h0d47003f64a06c001;
    stim[30] = 66'h0abc12714071f7527;
    stim[31] = 66'h04ff0b8e84f3c310f;
    stim[32] = 66'h11e7c0d55655adcac;
    stim[33] = 66'h16d24620e5c9476c7;
    stim[34] = 66'h1d7a01e050b9c4d20;
    stim[35] = 66'h0587d5423ed09c814;
    stim[36] = 66'h133756268fdb1f5c1;
    stim[37] = 66'h16fc6ef076704addb;
    stim[38] = 66'h1312d7de159e5d24a;
    stim[39] = 66'h2173f1e4da7fd1e71;
    stim[40] = 66'h09696aec003408384;
    stim[41] = 66'h159f64fc05a4fcc19;
    stim[42] = 66'h0e659e4b22216e239;
    stim[43] = 66'h0835a4d0044576f83;
    stim[44] = 66'h026b58e642d8c6a6d;
    stim[45] = 66'h03a75c0372aa251d8;
    stim[46] = 66'h106d2bb7c7d06b7a9;
    stim[47] = 66'h1c3f7a61be5a8b278;
    stim[48] = 66'h131a5abfe4da28f3c;
    stim[49] = 66'h1c9ac99b3fbb533aa;
    stim[50] = 66'h13a517620a42e8a17;
    stim[51] = 66'h1c91fb36375234aa5;
    stim[52] = 66'h0871f4b465b794e0f;
    stim[53] = 66'h13ce2e62671225f1f;
    stim[54] = 66'h1f991ace800acc65a;
    stim[55] = 66'h0d3e87ca9789d0546;
    stim[56] = 66'h0e75c3cbc7a5e1d18;
    stim[57] = 66'h0cec811410f996971;
    stim[58] = 66'h035cccde1851aab64;
    stim[59] = 66'h100bd55d5335ffb1b;
    stim[60] = 66'h0159f1bf0407021ff;
    stim[61] = 66'h1ac0e953b5a5b7b16;
    stim[62] = 66'h1fa67e711fc9b3f35;
    stim[63] = 66'h1db4fa8f5455ee13d;
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
      expv[0] = 65'h00000000000000000;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h000000000ca955688;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000000;
      expv[6] = 65'h00000000000000000;
      expv[7] = 65'h000000001572baa38;
      expv[8] = 65'h000000001572baa38;
      expv[9] = 65'h000000000ab95d51c;
      expv[10] = 65'h00000000126516322;
      expv[11] = 65'h0000000009328b190;
      expv[12] = 65'h000000001e4b07740;
      expv[13] = 65'h000000000c29a1e56;
      expv[14] = 65'h000000000c29a1e56;
      expv[15] = 65'h01add5ab4c29a1e56;
      expv[16] = 65'h00d6ead5a614d0f2a;
      expv[17] = 65'h00d6ead5a614d0f2a;
      expv[18] = 65'h0284c080e614d0f2a;
      expv[19] = 65'h01426040730a68794;
      expv[20] = 65'h01426040730a68794;
      expv[21] = 65'h00a130203985343ca;
      expv[22] = 65'h00a130203985343ca;
      expv[23] = 65'h024f05cb7985343ca;
      expv[24] = 65'h012782e5bcc29a1e4;
      expv[25] = 65'h0000000004876d5a0;
      expv[26] = 65'h000000000243b6ad0;
      expv[27] = 65'h000000000b5a747be;
      expv[28] = 65'h000000000a38af5c8;
      expv[29] = 65'h000000000dfc89850;
      expv[30] = 65'h0000000004a06c000;
      expv[31] = 65'h000000000071f7526;
      expv[32] = 65'h0000000004f3c310e;
      expv[33] = 65'h0000000004f3c310e;
      expv[34] = 65'h0000000005c9476c6;
      expv[35] = 65'h0000000002e4a3b62;
      expv[36] = 65'h0000000002e4a3b62;
      expv[37] = 65'h000000000fdb1f5c0;
      expv[38] = 65'h0000000016704adda;
      expv[39] = 65'h00000000000000000;
      expv[40] = 65'h00000000000000000;
      expv[41] = 65'h00000000000000000;
      expv[42] = 65'h0000000005a4fcc18;
      expv[43] = 65'h0000000002216e238;
      expv[44] = 65'h00000000044576f82;
      expv[45] = 65'h0000000002d8c6a6c;
      expv[46] = 65'h026b58e642d8c6a6c;
      expv[47] = 65'h0000000007d06b7a8;
      expv[48] = 65'h0000000007d06b7a8;
      expv[49] = 65'h0000000003e835bd4;
      expv[50] = 65'h0000000003e835bd4;
      expv[51] = 65'h000000000a42e8a16;
      expv[52] = 65'h00000000175234aa4;
      expv[53] = 65'h0000000005b794e0e;
      expv[54] = 65'h00000000071225f1e;
      expv[55] = 65'h00000000071225f1e;
      expv[56] = 65'h13ce2e62671225f1e;
      expv[57] = 65'h09e71731338912f8e;
      expv[58] = 65'h0000000010f996970;
      expv[59] = 65'h0cec811410f996970;
      expv[60] = 65'h000000001335ffb1a;
      expv[61] = 65'h000000000407021fe;
      expv[62] = 65'h0159f1bf0407021fe;
      expv[63] = 65'h000000001fc9b3f34;
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
