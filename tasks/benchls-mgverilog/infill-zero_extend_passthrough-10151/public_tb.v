// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10151 dut (
    .clock(clk),
    .reset(in_vec[34:34]),
    .i_datain(in_vec[33:2]),
    .i_datain_valid(in_vec[1:1]),
    .i_dataout_stall(in_vec[0:0]),
    .o_datain_stall(out_vec[65:65]),
    .o_dataout(out_vec[64:1]),
    .o_dataout_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h42e742480;
    stim[1] = 35'h4be4988ef;
    stim[2] = 35'h197e5bdc7;
    stim[3] = 35'h072fafbfa;
    stim[4] = 35'h2443145a6;
    stim[5] = 35'h3eddf3522;
    stim[6] = 35'h1c20cd610;
    stim[7] = 35'h1d096d2bd;
    stim[8] = 35'h7a1e49d92;
    stim[9] = 35'h08a2a4744;
    stim[10] = 35'h09d2f5407;
    stim[11] = 35'h328629005;
    stim[12] = 35'h36eb717d4;
    stim[13] = 35'h060071330;
    stim[14] = 35'h284ac6d7e;
    stim[15] = 35'h09564c7d6;
    stim[16] = 35'h0be19ba80;
    stim[17] = 35'h37dee6bef;
    stim[18] = 35'h0e7ddeefb;
    stim[19] = 35'h5259cc54a;
    stim[20] = 35'h1a3b7c115;
    stim[21] = 35'h0655c1f67;
    stim[22] = 35'h2abc028b3;
    stim[23] = 35'h25fa540aa;
    stim[24] = 35'h16c0bf682;
    stim[25] = 35'h2a4087f98;
    stim[26] = 35'h354d55882;
    stim[27] = 35'h2f129960d;
    stim[28] = 35'h1b25c871d;
    stim[29] = 35'h35da5fdf4;
    stim[30] = 35'h05ccf0263;
    stim[31] = 35'h238044928;
    stim[32] = 35'h2a7e7a043;
    stim[33] = 35'h3359f5961;
    stim[34] = 35'h2e6169698;
    stim[35] = 35'h2a4eeffa5;
    stim[36] = 35'h0c73f85c5;
    stim[37] = 35'h36f9bd530;
    stim[38] = 35'h0200cb589;
    stim[39] = 35'h36d329c63;
    stim[40] = 35'h13fd8c66d;
    stim[41] = 35'h2ea25c697;
    stim[42] = 35'h0e87986d3;
    stim[43] = 35'h1597f26c4;
    stim[44] = 35'h1211846d0;
    stim[45] = 35'h2dec24a0d;
    stim[46] = 35'h3f9c477cf;
    stim[47] = 35'h3878a393e;
    stim[48] = 35'h3e885b916;
    stim[49] = 35'h333417ed4;
    stim[50] = 35'h2d97b3f0e;
    stim[51] = 35'h006c32c89;
    stim[52] = 35'h2037524a4;
    stim[53] = 35'h16aea1054;
    stim[54] = 35'h08ad091c7;
    stim[55] = 35'h1484e0608;
    stim[56] = 35'h266869752;
    stim[57] = 35'h1ba643380;
    stim[58] = 35'h2270eb9b4;
    stim[59] = 35'h3b002d145;
    stim[60] = 35'h3400c814a;
    stim[61] = 35'h12fedd148;
    stim[62] = 35'h0345b8c54;
    stim[63] = 35'h19b3fa47d;
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
      expv[0] = 66'h000000000173a1240;
      expv[1] = 66'h2000000005f24c477;
      expv[2] = 66'h200000000cbf2dee3;
      expv[3] = 66'h000000000397d7dfd;
      expv[4] = 66'h0000000012218a2d3;
      expv[5] = 66'h000000001f6ef9a91;
      expv[6] = 66'h000000000e1066b08;
      expv[7] = 66'h200000000e84b695e;
      expv[8] = 66'h000000001d0f24ec9;
      expv[9] = 66'h000000000451523a2;
      expv[10] = 66'h2000000004e97aa03;
      expv[11] = 66'h20000000194314802;
      expv[12] = 66'h000000001b75b8bea;
      expv[13] = 66'h00000000030038998;
      expv[14] = 66'h000000001425636bf;
      expv[15] = 66'h0000000004ab263eb;
      expv[16] = 66'h0000000005f0cdd40;
      expv[17] = 66'h200000001bef735f7;
      expv[18] = 66'h20000000073eef77d;
      expv[19] = 66'h00000000092ce62a5;
      expv[20] = 66'h200000000d1dbe08a;
      expv[21] = 66'h20000000032ae0fb3;
      expv[22] = 66'h20000000155e01459;
      expv[23] = 66'h0000000012fd2a055;
      expv[24] = 66'h000000000b605fb41;
      expv[25] = 66'h00000000152043fcc;
      expv[26] = 66'h000000001aa6aac41;
      expv[27] = 66'h2000000017894cb06;
      expv[28] = 66'h200000000d92e438e;
      expv[29] = 66'h000000001aed2fefa;
      expv[30] = 66'h2000000002e678131;
      expv[31] = 66'h0000000011c022494;
      expv[32] = 66'h20000000153f3d021;
      expv[33] = 66'h2000000019acfacb0;
      expv[34] = 66'h000000001730b4b4c;
      expv[35] = 66'h20000000152777fd2;
      expv[36] = 66'h200000000639fc2e2;
      expv[37] = 66'h000000001b7cdea98;
      expv[38] = 66'h20000000010065ac4;
      expv[39] = 66'h200000001b6994e31;
      expv[40] = 66'h2000000009fec6336;
      expv[41] = 66'h2000000017512e34b;
      expv[42] = 66'h200000000743cc369;
      expv[43] = 66'h000000000acbf9362;
      expv[44] = 66'h000000000908c2368;
      expv[45] = 66'h2000000016f612506;
      expv[46] = 66'h200000001fce23be7;
      expv[47] = 66'h000000001c3c51c9f;
      expv[48] = 66'h000000001f442dc8b;
      expv[49] = 66'h00000000199a0bf6a;
      expv[50] = 66'h0000000016cbd9f87;
      expv[51] = 66'h20000000003619644;
      expv[52] = 66'h00000000101ba9252;
      expv[53] = 66'h000000000b575082a;
      expv[54] = 66'h200000000456848e3;
      expv[55] = 66'h000000000a4270304;
      expv[56] = 66'h00000000133434ba9;
      expv[57] = 66'h000000000dd3219c0;
      expv[58] = 66'h00000000113875cda;
      expv[59] = 66'h200000001d80168a2;
      expv[60] = 66'h000000001a00640a5;
      expv[61] = 66'h00000000097f6e8a4;
      expv[62] = 66'h0000000001a2dc62a;
      expv[63] = 66'h200000000cd9fd23e;
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
