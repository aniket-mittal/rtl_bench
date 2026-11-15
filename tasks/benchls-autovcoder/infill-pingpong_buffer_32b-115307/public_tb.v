// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_115307 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h65aca325d;
    stim[1] = 35'h6672abc68;
    stim[2] = 35'h0d6246b5a;
    stim[3] = 35'h288a446a2;
    stim[4] = 35'h200a5303b;
    stim[5] = 35'h1ab2605b8;
    stim[6] = 35'h216e7661c;
    stim[7] = 35'h11726738b;
    stim[8] = 35'h14d0787ff;
    stim[9] = 35'h2aacb11d9;
    stim[10] = 35'h11f56f025;
    stim[11] = 35'h378d27727;
    stim[12] = 35'h21eed59f7;
    stim[13] = 35'h0989907b6;
    stim[14] = 35'h0022a169b;
    stim[15] = 35'h1c060ab3b;
    stim[16] = 35'h33bfa9134;
    stim[17] = 35'h32fa3ba92;
    stim[18] = 35'h1716d3876;
    stim[19] = 35'h01ddd2183;
    stim[20] = 35'h295d02a46;
    stim[21] = 35'h3379f25b6;
    stim[22] = 35'h1c4e1f2e4;
    stim[23] = 35'h61627b2b5;
    stim[24] = 35'h3e70330e7;
    stim[25] = 35'h0ab024c51;
    stim[26] = 35'h2da3561ac;
    stim[27] = 35'h2de408f8f;
    stim[28] = 35'h2bf550367;
    stim[29] = 35'h0f86ab6a3;
    stim[30] = 35'h3cb7b3b8f;
    stim[31] = 35'h301fff4e7;
    stim[32] = 35'h3fc40f3bc;
    stim[33] = 35'h2d87d7d02;
    stim[34] = 35'h1d6b38cb9;
    stim[35] = 35'h37ee18859;
    stim[36] = 35'h08e2df993;
    stim[37] = 35'h0fe7cf176;
    stim[38] = 35'h0cc9a711a;
    stim[39] = 35'h624e98128;
    stim[40] = 35'h12b4a5269;
    stim[41] = 35'h2884343dd;
    stim[42] = 35'h27404dfd7;
    stim[43] = 35'h1b27ac50d;
    stim[44] = 35'h150614da7;
    stim[45] = 35'h33a00204f;
    stim[46] = 35'h3b21b1537;
    stim[47] = 35'h35e5c5ec8;
    stim[48] = 35'h0458e80ae;
    stim[49] = 35'h1b5e8f315;
    stim[50] = 35'h0be485ce1;
    stim[51] = 35'h0399e094b;
    stim[52] = 35'h0a6a1a213;
    stim[53] = 35'h3b86aaa81;
    stim[54] = 35'h28ff1704c;
    stim[55] = 35'h366208102;
    stim[56] = 35'h1de5e6e98;
    stim[57] = 35'h1c8d0eb78;
    stim[58] = 35'h0c6004c29;
    stim[59] = 35'h4938a9fb2;
    stim[60] = 35'h1535ab037;
    stim[61] = 35'h1be788ed8;
    stim[62] = 35'h20716537b;
    stim[63] = 35'h3d4a74fc6;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h2672abc68;
      expv[3] = 35'h4d6246b58;
      expv[4] = 35'h688a446a2;
      expv[5] = 35'h600a5303b;
      expv[6] = 35'h600a5303b;
      expv[7] = 35'h600a5303a;
      expv[8] = 35'h51726738a;
      expv[9] = 35'h54d0787fe;
      expv[10] = 35'h6aacb11d8;
      expv[11] = 35'h51f56f024;
      expv[12] = 35'h778d27726;
      expv[13] = 35'h61eed59f7;
      expv[14] = 35'h21eed59f7;
      expv[15] = 35'h4989907b6;
      expv[16] = 35'h5c060ab3b;
      expv[17] = 35'h5c060ab3b;
      expv[18] = 35'h1c060ab3b;
      expv[19] = 35'h1c060ab3b;
      expv[20] = 35'h72fa3ba93;
      expv[21] = 35'h32fa3ba93;
      expv[22] = 35'h32fa3ba93;
      expv[23] = 35'h32fa3ba93;
      expv[24] = 35'h32fa3ba90;
      expv[25] = 35'h7e70330e4;
      expv[26] = 35'h4ab024c50;
      expv[27] = 35'h6da3561ac;
      expv[28] = 35'h6de408f8e;
      expv[29] = 35'h6bf550366;
      expv[30] = 35'h4f86ab6a2;
      expv[31] = 35'h7cb7b3b8e;
      expv[32] = 35'h701fff4e7;
      expv[33] = 35'h701fff4e7;
      expv[34] = 35'h301fff4e7;
      expv[35] = 35'h6d87d7d02;
      expv[36] = 35'h77ee18858;
      expv[37] = 35'h48e2df993;
      expv[38] = 35'h08e2df993;
      expv[39] = 35'h08e2df993;
      expv[40] = 35'h08e2df990;
      expv[41] = 35'h52b4a5268;
      expv[42] = 35'h6884343dc;
      expv[43] = 35'h67404dfd6;
      expv[44] = 35'h5b27ac50c;
      expv[45] = 35'h550614da6;
      expv[46] = 35'h73a00204e;
      expv[47] = 35'h7b21b1537;
      expv[48] = 35'h7b21b1537;
      expv[49] = 35'h3b21b1537;
      expv[50] = 35'h4458e80ae;
      expv[51] = 35'h4be485ce0;
      expv[52] = 35'h4399e094a;
      expv[53] = 35'h4a6a1a212;
      expv[54] = 35'h7b86aaa80;
      expv[55] = 35'h68ff1704c;
      expv[56] = 35'h766208103;
      expv[57] = 35'h766208103;
      expv[58] = 35'h766208102;
      expv[59] = 35'h4c6004c28;
      expv[60] = 35'h0938a9fb0;
      expv[61] = 35'h5535ab034;
      expv[62] = 35'h5be788ed8;
      expv[63] = 35'h60716537b;
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
