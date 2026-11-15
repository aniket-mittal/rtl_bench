// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_049862 dut (
    .clk(clk),
    .reset_n(in_vec[26:26]),
    .data_in_16bit(in_vec[25:10]),
    .start(in_vec[9:9]),
    .spi_busy(in_vec[8:8]),
    .spi_data_out(in_vec[7:0]),
    .busy(out_vec[26:26]),
    .data_out_16bit(out_vec[25:10]),
    .CS(out_vec[9:9]),
    .spi_data_in(out_vec[8:1]),
    .spi_start(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h137f7ba;
    stim[1] = 27'h3b08975;
    stim[2] = 27'h4d3b49f;
    stim[3] = 27'h65eab79;
    stim[4] = 27'h76d0076;
    stim[5] = 27'h571e276;
    stim[6] = 27'h4df405a;
    stim[7] = 27'h50b3f89;
    stim[8] = 27'h795c407;
    stim[9] = 27'h63235e2;
    stim[10] = 27'h4c5e6e5;
    stim[11] = 27'h42a2294;
    stim[12] = 27'h4df7799;
    stim[13] = 27'h5cc66b9;
    stim[14] = 27'h7d0cb63;
    stim[15] = 27'h6c79bbb;
    stim[16] = 27'h63a2209;
    stim[17] = 27'h4ff0c1e;
    stim[18] = 27'h51ddd02;
    stim[19] = 27'h43999b6;
    stim[20] = 27'h567f247;
    stim[21] = 27'h6423c04;
    stim[22] = 27'h4172a25;
    stim[23] = 27'h72e412c;
    stim[24] = 27'h513ef0c;
    stim[25] = 27'h55c7e34;
    stim[26] = 27'h5149317;
    stim[27] = 27'h5452940;
    stim[28] = 27'h3083b7f;
    stim[29] = 27'h47e7323;
    stim[30] = 27'h5a700f4;
    stim[31] = 27'h6f9ea3d;
    stim[32] = 27'h6d6a8c9;
    stim[33] = 27'h5960751;
    stim[34] = 27'h566a07e;
    stim[35] = 27'h5327d4b;
    stim[36] = 27'h4fdf3b9;
    stim[37] = 27'h432ba3e;
    stim[38] = 27'h633573c;
    stim[39] = 27'h7655eba;
    stim[40] = 27'h42c3edf;
    stim[41] = 27'h4b8f213;
    stim[42] = 27'h70c0dce;
    stim[43] = 27'h76749c0;
    stim[44] = 27'h19b90d5;
    stim[45] = 27'h786f8b6;
    stim[46] = 27'h57deff0;
    stim[47] = 27'h580b1c8;
    stim[48] = 27'h634d04c;
    stim[49] = 27'h52927ef;
    stim[50] = 27'h5938735;
    stim[51] = 27'h510720a;
    stim[52] = 27'h7138599;
    stim[53] = 27'h7a2692a;
    stim[54] = 27'h630b346;
    stim[55] = 27'h558e1dd;
    stim[56] = 27'h761a9ab;
    stim[57] = 27'h438836a;
    stim[58] = 27'h5581305;
    stim[59] = 27'h647f505;
    stim[60] = 27'h6ef8f85;
    stim[61] = 27'h55ba409;
    stim[62] = 27'h6f0219b;
    stim[63] = 27'h7738e83;
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
      expv[0] = 27'h0000200;
      expv[1] = 27'h0000200;
      expv[2] = 27'h0000200;
      expv[3] = 27'h0000200;
      expv[4] = 27'h4000000;
      expv[5] = 27'h40003b6;
      expv[6] = 27'h40003b7;
      expv[7] = 27'h40003b7;
      expv[8] = 27'h40003b7;
      expv[9] = 27'h41c0281;
      expv[10] = 27'h41c0281;
      expv[11] = 27'h41f9600;
      expv[12] = 27'h01f9600;
      expv[13] = 27'h41f9400;
      expv[14] = 27'h41f96e6;
      expv[15] = 27'h41f96e7;
      expv[16] = 27'h41f96e7;
      expv[17] = 27'h4279633;
      expv[18] = 27'h4279633;
      expv[19] = 27'h4279633;
      expv[20] = 27'h4279633;
      expv[21] = 27'h4251e00;
      expv[22] = 27'h0251e00;
      expv[23] = 27'h4251c00;
      expv[24] = 27'h4251f96;
      expv[25] = 27'h4251f97;
      expv[26] = 27'h4d11f21;
      expv[27] = 27'h4d11f21;
      expv[28] = 27'h0000200;
      expv[29] = 27'h0000200;
      expv[30] = 27'h4000000;
      expv[31] = 27'h40002d2;
      expv[32] = 27'h40002d3;
      expv[33] = 27'h40002d3;
      expv[34] = 27'h40002d3;
      expv[35] = 27'h5f80381;
      expv[36] = 27'h5f80381;
      expv[37] = 27'h5f80381;
      expv[38] = 27'h5f8fa00;
      expv[39] = 27'h1f8fa00;
      expv[40] = 27'h5f8f800;
      expv[41] = 27'h5f8fa16;
      expv[42] = 27'h5f8fa17;
      expv[43] = 27'h5f8fa17;
      expv[44] = 27'h0000200;
      expv[45] = 27'h0000200;
      expv[46] = 27'h0000200;
      expv[47] = 27'h4000000;
      expv[48] = 27'h40002c0;
      expv[49] = 27'h5300259;
      expv[50] = 27'h5300259;
      expv[51] = 27'h5300259;
      expv[52] = 27'h5302a00;
      expv[53] = 27'h1302a00;
      expv[54] = 27'h1302a00;
      expv[55] = 27'h5302800;
      expv[56] = 27'h5302aac;
      expv[57] = 27'h5302aad;
      expv[58] = 27'h5302aad;
      expv[59] = 27'h5302aad;
      expv[60] = 27'h5302aad;
      expv[61] = 27'h5302aad;
      expv[62] = 27'h4242a71;
      expv[63] = 27'h4242a71;
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
