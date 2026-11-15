// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 59;
  localparam OW = 75;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_124577 dut (
    .s00_axi_aclk(clk),
    .s00_axi_aresetn(in_vec[58:58]),
    .s00_axi_awaddr(in_vec[57:54]),
    .s00_axi_awprot(in_vec[53:51]),
    .s00_axi_awvalid(in_vec[50:50]),
    .s00_axi_wdata(in_vec[49:18]),
    .s00_axi_wstrb(in_vec[17:14]),
    .s00_axi_wvalid(in_vec[13:13]),
    .s00_axi_bready(in_vec[12:12]),
    .s00_axi_araddr(in_vec[11:8]),
    .s00_axi_arprot(in_vec[7:5]),
    .s00_axi_arvalid(in_vec[4:4]),
    .s00_axi_rready(in_vec[3:3]),
    .m00_axis_aclk(in_vec[2:2]),
    .m00_axis_aresetn(in_vec[1:1]),
    .m00_axis_tready(in_vec[0:0]),
    .s00_axi_awready(out_vec[74:74]),
    .s00_axi_wready(out_vec[73:73]),
    .s00_axi_bresp(out_vec[72:71]),
    .s00_axi_bvalid(out_vec[70:70]),
    .s00_axi_arready(out_vec[69:69]),
    .s00_axi_rdata(out_vec[68:37]),
    .s00_axi_rresp(out_vec[36:35]),
    .s00_axi_rvalid(out_vec[34:34]),
    .m00_axis_tvalid(out_vec[33:33]),
    .m00_axis_tdata(out_vec[32:1]),
    .m00_axis_tlast(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 59'h2e0823d7ef23fa2;
    stim[1] = 59'h1037469b1c736e1;
    stim[2] = 59'h6556aeb287e9fb8;
    stim[3] = 59'h6644bfeeebbf711;
    stim[4] = 59'h63229e150744eda;
    stim[5] = 59'h6f5621c93286456;
    stim[6] = 59'h45ce5fc8265d380;
    stim[7] = 59'h086c766d54e2b1c;
    stim[8] = 59'h2ab48a173e2b3a1;
    stim[9] = 59'h4118a4a2854e344;
    stim[10] = 59'h50c182e3906c7fd;
    stim[11] = 59'h53d37d723071714;
    stim[12] = 59'h5ed6e21059ab2a6;
    stim[13] = 59'h5cd2d7b376b2bd2;
    stim[14] = 59'h43b1ae1d75fe202;
    stim[15] = 59'h6a95ff6e228ad79;
    stim[16] = 59'h2e97103aae62743;
    stim[17] = 59'h6435524547b49c7;
    stim[18] = 59'h0ff288e20d29a20;
    stim[19] = 59'h57c3bc253340c37;
    stim[20] = 59'h4326aeace7dec8f;
    stim[21] = 59'h4898deee9848a55;
    stim[22] = 59'h585fd19fc651f50;
    stim[23] = 59'h4d4d66c90229ef2;
    stim[24] = 59'h5b72520c4147287;
    stim[25] = 59'h4354c316399799e;
    stim[26] = 59'h5e6a5d124ce7d7b;
    stim[27] = 59'h5b99d20f974e1fa;
    stim[28] = 59'h41519057ebf857a;
    stim[29] = 59'h5c595194c3c0046;
    stim[30] = 59'h50fe1718bf02da2;
    stim[31] = 59'h7755d50659a5e24;
    stim[32] = 59'h457ffe6591da0b8;
    stim[33] = 59'h76319830e7dc027;
    stim[34] = 59'h7e41dda3e9ade3c;
    stim[35] = 59'h7586688fed7efd0;
    stim[36] = 59'h6cb3ac2a7fde1e5;
    stim[37] = 59'h4b3748adce6017c;
    stim[38] = 59'h1d45c44f07213fc;
    stim[39] = 59'h72275aa76a8af78;
    stim[40] = 59'h77d03749611beed;
    stim[41] = 59'h66102f411fad7ee;
    stim[42] = 59'h7f3a52d8a186cac;
    stim[43] = 59'h761802218d10cbb;
    stim[44] = 59'h7671215138d31de;
    stim[45] = 59'h50e55254d873cb6;
    stim[46] = 59'h4a68e75b35afe8b;
    stim[47] = 59'h7d4f0c339bf1ad8;
    stim[48] = 59'h42628abcb8617f2;
    stim[49] = 59'h67a2b6ebf62ab1b;
    stim[50] = 59'h4a5b4e3003b19eb;
    stim[51] = 59'h6d397bc738075e3;
    stim[52] = 59'h5568ac23adf1d61;
    stim[53] = 59'h46afea2eaf94b6a;
    stim[54] = 59'h77a6fc38379a4db;
    stim[55] = 59'h7a6daa0f7c4d6ba;
    stim[56] = 59'h449586b6fa5d61a;
    stim[57] = 59'h77081723c74e12d;
    stim[58] = 59'h53e2c7227789f26;
    stim[59] = 59'h622462e83a683f1;
    stim[60] = 59'h6d90b8593a533db;
    stim[61] = 59'h40a730516490a2d;
    stim[62] = 59'h4ecc07e84b0742a;
    stim[63] = 59'h421c988fb28b025;
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
      expv[0] = 75'h0000000000000000000;
      expv[1] = 75'h0000000000000000000;
      expv[2] = 75'h0000000000000000000;
      expv[3] = 75'h0200000000400000000;
      expv[4] = 75'h6600000000400000000;
      expv[5] = 75'h0200000000400000000;
      expv[6] = 75'h6600000000400000000;
      expv[7] = 75'h0000000000000000000;
      expv[8] = 75'h0000000000000000000;
      expv[9] = 75'h0000000000000000000;
      expv[10] = 75'h0000000000000000000;
      expv[11] = 75'h0200000000400000000;
      expv[12] = 75'h0200000000400000000;
      expv[13] = 75'h6400000000000000000;
      expv[14] = 75'h6600000000400000000;
      expv[15] = 75'h0000000000000000000;
      expv[16] = 75'h0000000000000000000;
      expv[17] = 75'h0000000000000000000;
      expv[18] = 75'h0000000000000000000;
      expv[19] = 75'h0000000000000000000;
      expv[20] = 75'h0200000000400000000;
      expv[21] = 75'h0000000000000000000;
      expv[22] = 75'h0200000000400000000;
      expv[23] = 75'h0200000002400000000;
      expv[24] = 75'h0200000002400000000;
      expv[25] = 75'h6400000002000000000;
      expv[26] = 75'h6600000002400000000;
      expv[27] = 75'h6600000004400000000;
      expv[28] = 75'h0200000004400000000;
      expv[29] = 75'h0200000006400000000;
      expv[30] = 75'h0000000006000000000;
      expv[31] = 75'h6400000006000000000;
      expv[32] = 75'h0000000006000000000;
      expv[33] = 75'h660000000868cc1873f;
      expv[34] = 75'h0000000008000000000;
      expv[35] = 75'h020000000a400000000;
      expv[36] = 75'h020000000a400000000;
      expv[37] = 75'h000000000a000000000;
      expv[38] = 75'h0000000000000000000;
      expv[39] = 75'h0000000000000000000;
      expv[40] = 75'h0200000000400000000;
      expv[41] = 75'h6400000000000000000;
      expv[42] = 75'h0000000000000000000;
      expv[43] = 75'h0000000000000000000;
      expv[44] = 75'h0200000002400000000;
      expv[45] = 75'h6600000004400000000;
      expv[46] = 75'h6600000004400000000;
      expv[47] = 75'h6400000004000000000;
      expv[48] = 75'h0200000006400000000;
      expv[49] = 75'h0200000008400000000;
      expv[50] = 75'h0200000008400000000;
      expv[51] = 75'h0000000008000000000;
      expv[52] = 75'h0000000008000000000;
      expv[53] = 75'h0000000008000000000;
      expv[54] = 75'h0000000008000000000;
      expv[55] = 75'h020000000c400000000;
      expv[56] = 75'h020000000e400000000;
      expv[57] = 75'h020000000e400000000;
      expv[58] = 75'h000000000e000000000;
      expv[59] = 75'h000000000e000000000;
      expv[60] = 75'h0200000010400000000;
      expv[61] = 75'h0200000012400000000;
      expv[62] = 75'h0000000012000000000;
      expv[63] = 75'h6400000012000000000;
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
