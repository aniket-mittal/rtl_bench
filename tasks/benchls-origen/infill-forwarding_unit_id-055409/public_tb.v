// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_055409 dut (
    .ex_mem_register_rd(in_vec[31:27]),
    .mem_wb_register_rd(in_vec[26:22]),
    .id_ex_register_rs(in_vec[21:17]),
    .id_ex_register_rt(in_vec[16:12]),
    .if_id_register_rs(in_vec[11:7]),
    .if_id_register_rt(in_vec[6:2]),
    .ex_mem_regwrite(in_vec[1:1]),
    .mem_wb_regwrite(in_vec[0:0]),
    .forward_a(out_vec[5:4]),
    .forward_b(out_vec[3:2]),
    .forward_c(out_vec[1:1]),
    .forward_d(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h4871a7df;
    stim[1] = 32'hfb260e2d;
    stim[2] = 32'h45b266e4;
    stim[3] = 32'hcbf593cd;
    stim[4] = 32'h61989e37;
    stim[5] = 32'h240687a4;
    stim[6] = 32'hc6d1fe40;
    stim[7] = 32'hc5b655f9;
    stim[8] = 32'hcdc3518d;
    stim[9] = 32'hb5effd80;
    stim[10] = 32'hf72ddf57;
    stim[11] = 32'ha2ffc945;
    stim[12] = 32'h20b67c92;
    stim[13] = 32'habc4f18a;
    stim[14] = 32'hc8b05b00;
    stim[15] = 32'hca03ef40;
    stim[16] = 32'h71e1ac71;
    stim[17] = 32'h2ef7f7d6;
    stim[18] = 32'h166b73f5;
    stim[19] = 32'hc2c87ec0;
    stim[20] = 32'h9189245b;
    stim[21] = 32'h9449082f;
    stim[22] = 32'hf83691bd;
    stim[23] = 32'h45c23752;
    stim[24] = 32'h8bdba5ea;
    stim[25] = 32'haaaa4e7f;
    stim[26] = 32'h77db759b;
    stim[27] = 32'ha417e5a2;
    stim[28] = 32'h48338f73;
    stim[29] = 32'h94bba4c8;
    stim[30] = 32'h19814b6b;
    stim[31] = 32'hef0a08e4;
    stim[32] = 32'hcc68f2da;
    stim[33] = 32'hd7bd573c;
    stim[34] = 32'h625ae0b4;
    stim[35] = 32'h0ee0ba33;
    stim[36] = 32'h0b797e14;
    stim[37] = 32'h4d06c1ef;
    stim[38] = 32'hb424600f;
    stim[39] = 32'hdf79d548;
    stim[40] = 32'hbada1ffb;
    stim[41] = 32'h7c529c51;
    stim[42] = 32'h7e36b3f4;
    stim[43] = 32'h1f675b97;
    stim[44] = 32'he38359f8;
    stim[45] = 32'h94190457;
    stim[46] = 32'h7e46db55;
    stim[47] = 32'hdedf3c66;
    stim[48] = 32'he39c3e60;
    stim[49] = 32'h189479cb;
    stim[50] = 32'h8b0b0a1f;
    stim[51] = 32'hcd8f1227;
    stim[52] = 32'h1797f44b;
    stim[53] = 32'h76995747;
    stim[54] = 32'h272e2847;
    stim[55] = 32'hd966c106;
    stim[56] = 32'hecd4a833;
    stim[57] = 32'hfab2fe62;
    stim[58] = 32'h66566dda;
    stim[59] = 32'had447185;
    stim[60] = 32'h76f6fb79;
    stim[61] = 32'h2ba0e27c;
    stim[62] = 32'h20b768a5;
    stim[63] = 32'h5357ba81;
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
      expv[0] = 6'h00;
      expv[1] = 6'h00;
      expv[2] = 6'h00;
      expv[3] = 6'h00;
      expv[4] = 6'h20;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h00;
      expv[8] = 6'h00;
      expv[9] = 6'h00;
      expv[10] = 6'h00;
      expv[11] = 6'h00;
      expv[12] = 6'h00;
      expv[13] = 6'h00;
      expv[14] = 6'h00;
      expv[15] = 6'h00;
      expv[16] = 6'h00;
      expv[17] = 6'h00;
      expv[18] = 6'h00;
      expv[19] = 6'h00;
      expv[20] = 6'h08;
      expv[21] = 6'h00;
      expv[22] = 6'h00;
      expv[23] = 6'h00;
      expv[24] = 6'h00;
      expv[25] = 6'h20;
      expv[26] = 6'h00;
      expv[27] = 6'h00;
      expv[28] = 6'h00;
      expv[29] = 6'h00;
      expv[30] = 6'h00;
      expv[31] = 6'h00;
      expv[32] = 6'h00;
      expv[33] = 6'h00;
      expv[34] = 6'h00;
      expv[35] = 6'h00;
      expv[36] = 6'h00;
      expv[37] = 6'h00;
      expv[38] = 6'h00;
      expv[39] = 6'h00;
      expv[40] = 6'h00;
      expv[41] = 6'h00;
      expv[42] = 6'h00;
      expv[43] = 6'h00;
      expv[44] = 6'h00;
      expv[45] = 6'h04;
      expv[46] = 6'h00;
      expv[47] = 6'h00;
      expv[48] = 6'h00;
      expv[49] = 6'h00;
      expv[50] = 6'h00;
      expv[51] = 6'h00;
      expv[52] = 6'h00;
      expv[53] = 6'h00;
      expv[54] = 6'h00;
      expv[55] = 6'h00;
      expv[56] = 6'h00;
      expv[57] = 6'h00;
      expv[58] = 6'h00;
      expv[59] = 6'h00;
      expv[60] = 6'h10;
      expv[61] = 6'h00;
      expv[62] = 6'h00;
      expv[63] = 6'h00;
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
