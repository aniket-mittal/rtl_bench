// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  Avg dut (
    .data(in_vec[31:0]),
    .result(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h750aae80;
    stim[1] = 32'h90af6087;
    stim[2] = 32'h9d8eda2a;
    stim[3] = 32'h13b33a3f;
    stim[4] = 32'h0e8665cf;
    stim[5] = 32'h6cd8281d;
    stim[6] = 32'h973e0931;
    stim[7] = 32'hfd16b707;
    stim[8] = 32'hea2edc2b;
    stim[9] = 32'h30b26230;
    stim[10] = 32'h76e9bebc;
    stim[11] = 32'hfcb63750;
    stim[12] = 32'h12e17f24;
    stim[13] = 32'h9c926195;
    stim[14] = 32'ha441c32c;
    stim[15] = 32'hfa203aa8;
    stim[16] = 32'h9ed45524;
    stim[17] = 32'hfcf43ee2;
    stim[18] = 32'h26064e98;
    stim[19] = 32'h797146e2;
    stim[20] = 32'h46149597;
    stim[21] = 32'h71a68f17;
    stim[22] = 32'h01848130;
    stim[23] = 32'hf513f2f5;
    stim[24] = 32'h72c66167;
    stim[25] = 32'hdba60341;
    stim[26] = 32'hcc338530;
    stim[27] = 32'h69d8c064;
    stim[28] = 32'h6014bf24;
    stim[29] = 32'hf05b59df;
    stim[30] = 32'h5832fa20;
    stim[31] = 32'h1c8b793e;
    stim[32] = 32'hd1b71e21;
    stim[33] = 32'h6bad33a9;
    stim[34] = 32'h15d5ab81;
    stim[35] = 32'hc470eb97;
    stim[36] = 32'h0c9cae6b;
    stim[37] = 32'h9968de35;
    stim[38] = 32'h647391d8;
    stim[39] = 32'h3886cac8;
    stim[40] = 32'h73eef47a;
    stim[41] = 32'hf33a5785;
    stim[42] = 32'h1646cee8;
    stim[43] = 32'hce564bb7;
    stim[44] = 32'he83418ed;
    stim[45] = 32'h003e569d;
    stim[46] = 32'h861cfe41;
    stim[47] = 32'h3b9db162;
    stim[48] = 32'hc408152a;
    stim[49] = 32'h31f62930;
    stim[50] = 32'h2159a2c1;
    stim[51] = 32'he571ab1d;
    stim[52] = 32'h5b0d9adb;
    stim[53] = 32'h1fa3099e;
    stim[54] = 32'h7940c87c;
    stim[55] = 32'h11b78581;
    stim[56] = 32'hfd13e001;
    stim[57] = 32'haab42289;
    stim[58] = 32'h82d3982f;
    stim[59] = 32'h0e625246;
    stim[60] = 32'h0a91d6ec;
    stim[61] = 32'h5eeca80b;
    stim[62] = 32'h9c6bfd90;
    stim[63] = 32'h74a68e62;
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
      expv[0] = 8'hec;
      expv[1] = 8'hca;
      expv[2] = 8'hcc;
      expv[3] = 8'h0f;
      expv[4] = 8'hf2;
      expv[5] = 8'h22;
      expv[6] = 8'h03;
      expv[7] = 8'hf5;
      expv[8] = 8'h07;
      expv[9] = 8'h1d;
      expv[10] = 8'hf7;
      expv[11] = 8'h0e;
      expv[12] = 8'h25;
      expv[13] = 8'hc9;
      expv[14] = 8'hf5;
      expv[15] = 8'hff;
      expv[16] = 8'hfb;
      expv[17] = 8'h04;
      expv[18] = 8'h04;
      expv[19] = 8'h44;
      expv[20] = 8'he2;
      expv[21] = 8'hf0;
      expv[22] = 8'hce;
      expv[23] = 8'hfc;
      expv[24] = 8'h40;
      expv[25] = 8'hf2;
      expv[26] = 8'hed;
      expv[27] = 8'h19;
      expv[28] = 8'h15;
      expv[29] = 8'h20;
      expv[30] = 8'h29;
      expv[31] = 8'h17;
      expv[32] = 8'hf2;
      expv[33] = 8'hfd;
      expv[34] = 8'hc6;
      expv[35] = 8'hee;
      expv[36] = 8'hf1;
      expv[37] = 8'h05;
      expv[38] = 8'h10;
      expv[39] = 8'hd4;
      expv[40] = 8'h33;
      expv[41] = 8'h02;
      expv[42] = 8'h04;
      expv[43] = 8'h09;
      expv[44] = 8'h08;
      expv[45] = 8'h0c;
      expv[46] = 8'hf9;
      expv[47] = 8'hfb;
      expv[48] = 8'h02;
      expv[49] = 8'h20;
      expv[50] = 8'hf8;
      expv[51] = 8'h07;
      expv[52] = 8'hf8;
      expv[53] = 8'hdb;
      expv[54] = 8'h3f;
      expv[55] = 8'hb4;
      expv[56] = 8'hfd;
      expv[57] = 8'hc3;
      expv[58] = 8'hc7;
      expv[59] = 8'h42;
      expv[60] = 8'hd8;
      expv[61] = 8'h00;
      expv[62] = 8'he5;
      expv[63] = 8'h02;
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
