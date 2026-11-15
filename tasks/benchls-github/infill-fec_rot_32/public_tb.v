// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  fec_rot_32 dut (
    .c(in_vec[31:0]),
    .co(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h7d0d8ffe;
    stim[1] = 32'h4b385468;
    stim[2] = 32'h07a52b15;
    stim[3] = 32'h244fa4de;
    stim[4] = 32'h6fb2e2d2;
    stim[5] = 32'hfdcac27b;
    stim[6] = 32'hb7b41183;
    stim[7] = 32'hdbd4361d;
    stim[8] = 32'h3da2f88c;
    stim[9] = 32'h19ad598b;
    stim[10] = 32'h84ecd2eb;
    stim[11] = 32'h4b1cd56e;
    stim[12] = 32'h13f0135b;
    stim[13] = 32'h7dcf2a05;
    stim[14] = 32'h610d3e35;
    stim[15] = 32'hacbb0e31;
    stim[16] = 32'hf7ac294b;
    stim[17] = 32'h57d8f7c7;
    stim[18] = 32'h6c6fb5dd;
    stim[19] = 32'he294307e;
    stim[20] = 32'hc5a304a9;
    stim[21] = 32'h335826f0;
    stim[22] = 32'h3fe5f51c;
    stim[23] = 32'h519d3714;
    stim[24] = 32'h4c74af1f;
    stim[25] = 32'haf088447;
    stim[26] = 32'h4da3f071;
    stim[27] = 32'he13513da;
    stim[28] = 32'h7cc00c9f;
    stim[29] = 32'h47c7bd63;
    stim[30] = 32'h46c5a31a;
    stim[31] = 32'haf775885;
    stim[32] = 32'he4a42686;
    stim[33] = 32'h00d77655;
    stim[34] = 32'h339668aa;
    stim[35] = 32'h9827909e;
    stim[36] = 32'h3ff67986;
    stim[37] = 32'ha102e675;
    stim[38] = 32'h8651befd;
    stim[39] = 32'h9cb4ff7e;
    stim[40] = 32'h614562f6;
    stim[41] = 32'h1b81fffb;
    stim[42] = 32'h5d5b0c9c;
    stim[43] = 32'h4726a5fc;
    stim[44] = 32'h160b4236;
    stim[45] = 32'hb1039ac6;
    stim[46] = 32'h176a2d59;
    stim[47] = 32'h19c503ec;
    stim[48] = 32'h29fe080a;
    stim[49] = 32'h400f7bf8;
    stim[50] = 32'h9dcadefe;
    stim[51] = 32'ha74c2e46;
    stim[52] = 32'hb108d725;
    stim[53] = 32'h0f8489a1;
    stim[54] = 32'h69dfc0c0;
    stim[55] = 32'ha6138648;
    stim[56] = 32'h3e9bc630;
    stim[57] = 32'hd1cf800f;
    stim[58] = 32'h69e7d605;
    stim[59] = 32'h490f06a8;
    stim[60] = 32'hc89d133c;
    stim[61] = 32'hb1b4bf56;
    stim[62] = 32'h88b039b9;
    stim[63] = 32'hbcba0b95;
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
      expv[0] = 32'h3a20b2b2;
      expv[1] = 32'h61118d1d;
      expv[2] = 32'hc3394753;
      expv[3] = 32'h180fe329;
      expv[4] = 32'h636d7fa3;
      expv[5] = 32'h69cca9ff;
      expv[6] = 32'h99c1f1cb;
      expv[7] = 32'hf7661ab7;
      expv[8] = 32'h818b0cb2;
      expv[9] = 32'hc4aa3573;
      expv[10] = 32'ha6b66600;
      expv[11] = 32'h51d9b5bb;
      expv[12] = 32'h105e2486;
      expv[13] = 32'hd20f5d5a;
      expv[14] = 32'hf669ecfc;
      expv[15] = 32'hc17aa0c9;
      expv[16] = 32'hacd7b66d;
      expv[17] = 32'h4e2bcc4c;
      expv[18] = 32'ha0d5f6eb;
      expv[19] = 32'h58fb57ca;
      expv[20] = 32'h3a942114;
      expv[21] = 32'h7d9b55e5;
      expv[22] = 32'h48c71b3b;
      expv[23] = 32'h9e8cc3b9;
      expv[24] = 32'h1a6be5f8;
      expv[25] = 32'h6409f900;
      expv[26] = 32'h4150e2f6;
      expv[27] = 32'h59a69f88;
      expv[28] = 32'hee7bcf70;
      expv[29] = 32'he75aeed5;
      expv[30] = 32'ha4096448;
      expv[31] = 32'h66aff6e2;
      expv[32] = 32'h58cd1bce;
      expv[33] = 32'hc5b29bf0;
      expv[34] = 32'h5ea9b76f;
      expv[35] = 32'h53a2fb78;
      expv[36] = 32'ha503c8b6;
      expv[37] = 32'h459bea94;
      expv[38] = 32'h24f67d49;
      expv[39] = 32'hf9dcdaf0;
      expv[40] = 32'h71efe2d7;
      expv[41] = 32'h97b93cc2;
      expv[42] = 32'h5233b452;
      expv[43] = 32'h681e2ae9;
      expv[44] = 32'he37435cb;
      expv[45] = 32'h227a71f4;
      expv[46] = 32'h4def10e4;
      expv[47] = 32'h41d9134e;
      expv[48] = 32'h35ca2e2c;
      expv[49] = 32'hfe8fc42a;
      expv[50] = 32'haaf087e1;
      expv[51] = 32'h4e1be17a;
      expv[52] = 32'hcad56c62;
      expv[53] = 32'h558eeb8e;
      expv[54] = 32'h53bc756d;
      expv[55] = 32'h063bc4d1;
      expv[56] = 32'h1c1e2611;
      expv[57] = 32'h42d409f7;
      expv[58] = 32'hcaea57a2;
      expv[59] = 32'hb2e70656;
      expv[60] = 32'h644bc467;
      expv[61] = 32'he4d6da08;
      expv[62] = 32'h018fe403;
      expv[63] = 32'h13d3861d;
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
