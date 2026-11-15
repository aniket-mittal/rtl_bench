// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_093101 dut (
    .clk(clk),
    .reset(in_vec[39:39]),
    .numerator(in_vec[38:20]),
    .denominator(in_vec[19:1]),
    .enable(in_vec[0:0]),
    .done(out_vec[8:8]),
    .percent(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'hcc1ab382da;
    stim[1] = 40'hf72e1d42b5;
    stim[2] = 40'h5db12b4dcd;
    stim[3] = 40'h65bcb5355c;
    stim[4] = 40'h3f9dc2fb25;
    stim[5] = 40'h41bc83d9a0;
    stim[6] = 40'h5ec8983851;
    stim[7] = 40'h30575e3273;
    stim[8] = 40'h5dd2333efa;
    stim[9] = 40'h4e0b9b8b70;
    stim[10] = 40'h7fdab87ea6;
    stim[11] = 40'h5b69f0453e;
    stim[12] = 40'h4b26b8ec33;
    stim[13] = 40'h29efeb4cff;
    stim[14] = 40'h771a794092;
    stim[15] = 40'h0230cba63d;
    stim[16] = 40'h274c1bf3ca;
    stim[17] = 40'h6729ce3942;
    stim[18] = 40'h1e49f9a0ea;
    stim[19] = 40'h6f819e5714;
    stim[20] = 40'h3f05599d0e;
    stim[21] = 40'h54658cba8f;
    stim[22] = 40'h5e51385aa3;
    stim[23] = 40'h7b7f792292;
    stim[24] = 40'h36041448b5;
    stim[25] = 40'h7b4ce7fef3;
    stim[26] = 40'h6e22f7433e;
    stim[27] = 40'h5501f809af;
    stim[28] = 40'h382609e6da;
    stim[29] = 40'h713b0aab95;
    stim[30] = 40'h53c9c35294;
    stim[31] = 40'h16dc3dfcfd;
    stim[32] = 40'h16d3d076fe;
    stim[33] = 40'h6db9f5b842;
    stim[34] = 40'h265c5fa044;
    stim[35] = 40'h082087ecd3;
    stim[36] = 40'h3137c795ae;
    stim[37] = 40'h73e7c79bc1;
    stim[38] = 40'h5c62de3e7b;
    stim[39] = 40'h7416f3d1f6;
    stim[40] = 40'h764685fe31;
    stim[41] = 40'h2c61986085;
    stim[42] = 40'h5cdd23a3b4;
    stim[43] = 40'h769ed0b5ea;
    stim[44] = 40'h0718db1c5d;
    stim[45] = 40'h3fbdb03172;
    stim[46] = 40'h0c6a5910ac;
    stim[47] = 40'h6d01577c12;
    stim[48] = 40'h1da46ffd82;
    stim[49] = 40'h2a17136691;
    stim[50] = 40'h4fe6ded0eb;
    stim[51] = 40'h414622f43f;
    stim[52] = 40'h758d0735d3;
    stim[53] = 40'h131ba52d49;
    stim[54] = 40'h3d4b43d3e8;
    stim[55] = 40'h72a5178fe0;
    stim[56] = 40'h5f52dc9174;
    stim[57] = 40'h17d56ed5d1;
    stim[58] = 40'h6c5e8f2f74;
    stim[59] = 40'h00b874270a;
    stim[60] = 40'h311b7f747f;
    stim[61] = 40'h50977df625;
    stim[62] = 40'h7ece892792;
    stim[63] = 40'h35cd5df276;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h111;
      expv[23] = 9'h011;
      expv[24] = 9'h011;
      expv[25] = 9'h011;
      expv[26] = 9'h011;
      expv[27] = 9'h011;
      expv[28] = 9'h011;
      expv[29] = 9'h011;
      expv[30] = 9'h011;
      expv[31] = 9'h011;
      expv[32] = 9'h011;
      expv[33] = 9'h011;
      expv[34] = 9'h011;
      expv[35] = 9'h011;
      expv[36] = 9'h011;
      expv[37] = 9'h011;
      expv[38] = 9'h011;
      expv[39] = 9'h011;
      expv[40] = 9'h011;
      expv[41] = 9'h011;
      expv[42] = 9'h011;
      expv[43] = 9'h011;
      expv[44] = 9'h011;
      expv[45] = 9'h011;
      expv[46] = 9'h115;
      expv[47] = 9'h115;
      expv[48] = 9'h115;
      expv[49] = 9'h115;
      expv[50] = 9'h015;
      expv[51] = 9'h015;
      expv[52] = 9'h015;
      expv[53] = 9'h101;
      expv[54] = 9'h001;
      expv[55] = 9'h001;
      expv[56] = 9'h001;
      expv[57] = 9'h001;
      expv[58] = 9'h001;
      expv[59] = 9'h001;
      expv[60] = 9'h001;
      expv[61] = 9'h001;
      expv[62] = 9'h001;
      expv[63] = 9'h001;
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
