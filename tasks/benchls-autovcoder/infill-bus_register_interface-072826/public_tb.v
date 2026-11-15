// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072826 dut (
    .clock(clk),
    .reset(in_vec[13:13]),
    .chip_select_n(in_vec[12:12]),
    .read_enable_n(in_vec[11:11]),
    .write_enable_n(in_vec[10:10]),
    .address(in_vec[9:8]),
    .data_bus_in(in_vec[7:0]),
    .internal_data_bus(out_vec[14:7]),
    .write_port_a(out_vec[6:6]),
    .write_port_b(out_vec[5:5]),
    .write_port_c(out_vec[4:4]),
    .write_control(out_vec[3:3]),
    .read_port_a(out_vec[2:2]),
    .read_port_b(out_vec[1:1]),
    .read_port_c(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h2f76;
    stim[1] = 14'h3461;
    stim[2] = 14'h1e01;
    stim[3] = 14'h0a1f;
    stim[4] = 14'h08a4;
    stim[5] = 14'h10a7;
    stim[6] = 14'h13d5;
    stim[7] = 14'h1da1;
    stim[8] = 14'h1746;
    stim[9] = 14'h00d0;
    stim[10] = 14'h0e76;
    stim[11] = 14'h0bae;
    stim[12] = 14'h0ddc;
    stim[13] = 14'h1623;
    stim[14] = 14'h1483;
    stim[15] = 14'h1e49;
    stim[16] = 14'h1e52;
    stim[17] = 14'h0cad;
    stim[18] = 14'h0310;
    stim[19] = 14'h1cdc;
    stim[20] = 14'h015c;
    stim[21] = 14'h2a10;
    stim[22] = 14'h0540;
    stim[23] = 14'h0c99;
    stim[24] = 14'h038c;
    stim[25] = 14'h1add;
    stim[26] = 14'h1362;
    stim[27] = 14'h1052;
    stim[28] = 14'h006e;
    stim[29] = 14'h1401;
    stim[30] = 14'h043c;
    stim[31] = 14'h01cc;
    stim[32] = 14'h1ff4;
    stim[33] = 14'h1075;
    stim[34] = 14'h1787;
    stim[35] = 14'h184d;
    stim[36] = 14'h0d68;
    stim[37] = 14'h0c6c;
    stim[38] = 14'h1822;
    stim[39] = 14'h09a5;
    stim[40] = 14'h17c1;
    stim[41] = 14'h1186;
    stim[42] = 14'h0077;
    stim[43] = 14'h0a6a;
    stim[44] = 14'h0f5d;
    stim[45] = 14'h0bba;
    stim[46] = 14'h1bb5;
    stim[47] = 14'h19a4;
    stim[48] = 14'h0f6c;
    stim[49] = 14'h041e;
    stim[50] = 14'h1a4e;
    stim[51] = 14'h011a;
    stim[52] = 14'h0928;
    stim[53] = 14'h1a27;
    stim[54] = 14'h026a;
    stim[55] = 14'h0c3c;
    stim[56] = 14'h19d2;
    stim[57] = 14'h036d;
    stim[58] = 14'h0c95;
    stim[59] = 14'h038d;
    stim[60] = 14'h1e61;
    stim[61] = 14'h10c4;
    stim[62] = 14'h0edb;
    stim[63] = 14'h19f8;
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
      expv[0] = 15'h0000;
      expv[1] = 15'h0000;
      expv[2] = 15'h0000;
      expv[3] = 15'h0000;
      expv[4] = 15'h0f80;
      expv[5] = 15'h5200;
      expv[6] = 15'h5200;
      expv[7] = 15'h5200;
      expv[8] = 15'h5200;
      expv[9] = 15'h5204;
      expv[10] = 15'h6840;
      expv[11] = 15'h6800;
      expv[12] = 15'h5708;
      expv[13] = 15'h5700;
      expv[14] = 15'h5700;
      expv[15] = 15'h5700;
      expv[16] = 15'h5700;
      expv[17] = 15'h5700;
      expv[18] = 15'h5704;
      expv[19] = 15'h0808;
      expv[20] = 15'h0802;
      expv[21] = 15'h0000;
      expv[22] = 15'h0002;
      expv[23] = 15'h0000;
      expv[24] = 15'h0004;
      expv[25] = 15'h4600;
      expv[26] = 15'h4600;
      expv[27] = 15'h4600;
      expv[28] = 15'h4604;
      expv[29] = 15'h3740;
      expv[30] = 15'h3704;
      expv[31] = 15'h3702;
      expv[32] = 15'h6620;
      expv[33] = 15'h6600;
      expv[34] = 15'h6600;
      expv[35] = 15'h6600;
      expv[36] = 15'h6600;
      expv[37] = 15'h6600;
      expv[38] = 15'h6600;
      expv[39] = 15'h6600;
      expv[40] = 15'h52a0;
      expv[41] = 15'h5280;
      expv[42] = 15'h5284;
      expv[43] = 15'h3b80;
      expv[44] = 15'h3510;
      expv[45] = 15'h3500;
      expv[46] = 15'h5d00;
      expv[47] = 15'h5d00;
      expv[48] = 15'h5d00;
      expv[49] = 15'h5d04;
      expv[50] = 15'h5d00;
      expv[51] = 15'h5d02;
      expv[52] = 15'h0d00;
      expv[53] = 15'h1400;
      expv[54] = 15'h1401;
      expv[55] = 15'h3510;
      expv[56] = 15'h3500;
      expv[57] = 15'h3504;
      expv[58] = 15'h3688;
      expv[59] = 15'h3684;
      expv[60] = 15'h4688;
      expv[61] = 15'h4680;
      expv[62] = 15'h4680;
      expv[63] = 15'h4680;
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
