// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_095966 dut (
    .spi_clk(clk),
    .MISO(in_vec[18:18]),
    .spi_nrst(in_vec[17:17]),
    .spi_req(in_vec[16:16]),
    .SPI_OUT(in_vec[15:0]),
    .SCK(out_vec[20:20]),
    .CS(out_vec[19:19]),
    .MOSI(out_vec[18:18]),
    .spi_rdy(out_vec[17:17]),
    .spi_ack(out_vec[16:16]),
    .SPI_IN(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h31c54;
    stim[1] = 19'h6b384;
    stim[2] = 19'h56982;
    stim[3] = 19'h05e0c;
    stim[4] = 19'h16ee1;
    stim[5] = 19'h5913f;
    stim[6] = 19'h5cec3;
    stim[7] = 19'h1c3b6;
    stim[8] = 19'h53152;
    stim[9] = 19'h0fc64;
    stim[10] = 19'h1cf65;
    stim[11] = 19'h5c54c;
    stim[12] = 19'h54fba;
    stim[13] = 19'h1d103;
    stim[14] = 19'h49840;
    stim[15] = 19'h47d26;
    stim[16] = 19'h4b084;
    stim[17] = 19'h04ab5;
    stim[18] = 19'h1ad2b;
    stim[19] = 19'h082b9;
    stim[20] = 19'h3569e;
    stim[21] = 19'h1248c;
    stim[22] = 19'h4da8c;
    stim[23] = 19'h05cb8;
    stim[24] = 19'h5493f;
    stim[25] = 19'h167f7;
    stim[26] = 19'h4858f;
    stim[27] = 19'h0fc70;
    stim[28] = 19'h54c38;
    stim[29] = 19'h10f12;
    stim[30] = 19'h0337f;
    stim[31] = 19'h5a7a1;
    stim[32] = 19'h4618c;
    stim[33] = 19'h1e28c;
    stim[34] = 19'h33d79;
    stim[35] = 19'h5c3e2;
    stim[36] = 19'h06ddb;
    stim[37] = 19'h41f1c;
    stim[38] = 19'h07f95;
    stim[39] = 19'h507d3;
    stim[40] = 19'h5c39d;
    stim[41] = 19'h2c6c3;
    stim[42] = 19'h5ebfd;
    stim[43] = 19'h1b28b;
    stim[44] = 19'h11b72;
    stim[45] = 19'h1b601;
    stim[46] = 19'h0f68d;
    stim[47] = 19'h5f003;
    stim[48] = 19'h058b6;
    stim[49] = 19'h11f85;
    stim[50] = 19'h504e7;
    stim[51] = 19'h05319;
    stim[52] = 19'h5cfa4;
    stim[53] = 19'h4a727;
    stim[54] = 19'h05afc;
    stim[55] = 19'h5ab43;
    stim[56] = 19'h1e871;
    stim[57] = 19'h59a98;
    stim[58] = 19'h0c9ea;
    stim[59] = 19'h55c76;
    stim[60] = 19'h2be19;
    stim[61] = 19'h03d0b;
    stim[62] = 19'h00e0a;
    stim[63] = 19'h52430;
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
      expv[0] = 21'h180000;
      expv[1] = 21'h180000;
      expv[2] = 21'h180000;
      expv[3] = 21'h180000;
      expv[4] = 21'h180000;
      expv[5] = 21'h180000;
      expv[6] = 21'h180000;
      expv[7] = 21'h180000;
      expv[8] = 21'h180000;
      expv[9] = 21'h180000;
      expv[10] = 21'h180000;
      expv[11] = 21'h180000;
      expv[12] = 21'h180000;
      expv[13] = 21'h180000;
      expv[14] = 21'h180000;
      expv[15] = 21'h180000;
      expv[16] = 21'h180000;
      expv[17] = 21'h180000;
      expv[18] = 21'h180000;
      expv[19] = 21'h180000;
      expv[20] = 21'h180000;
      expv[21] = 21'h180000;
      expv[22] = 21'h180000;
      expv[23] = 21'h180000;
      expv[24] = 21'h180000;
      expv[25] = 21'h180000;
      expv[26] = 21'h180000;
      expv[27] = 21'h180000;
      expv[28] = 21'h180000;
      expv[29] = 21'h180000;
      expv[30] = 21'h180000;
      expv[31] = 21'h180000;
      expv[32] = 21'h180000;
      expv[33] = 21'h180000;
      expv[34] = 21'h180000;
      expv[35] = 21'h180000;
      expv[36] = 21'h180000;
      expv[37] = 21'h180000;
      expv[38] = 21'h180000;
      expv[39] = 21'h180000;
      expv[40] = 21'h180000;
      expv[41] = 21'h180000;
      expv[42] = 21'h180000;
      expv[43] = 21'h180000;
      expv[44] = 21'h180000;
      expv[45] = 21'h180000;
      expv[46] = 21'h180000;
      expv[47] = 21'h180000;
      expv[48] = 21'h180000;
      expv[49] = 21'h180000;
      expv[50] = 21'h180000;
      expv[51] = 21'h180000;
      expv[52] = 21'h180000;
      expv[53] = 21'h180000;
      expv[54] = 21'h180000;
      expv[55] = 21'h180000;
      expv[56] = 21'h180000;
      expv[57] = 21'h180000;
      expv[58] = 21'h180000;
      expv[59] = 21'h180000;
      expv[60] = 21'h180000;
      expv[61] = 21'h180000;
      expv[62] = 21'h180000;
      expv[63] = 21'h180000;
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
