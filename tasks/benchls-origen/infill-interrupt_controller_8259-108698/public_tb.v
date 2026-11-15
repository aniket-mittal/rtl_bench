// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_108698 dut (
    .clk(clk),
    .ce(in_vec[22:22]),
    .reset(in_vec[21:21]),
    .cs(in_vec[20:20]),
    .wr(in_vec[19:19]),
    .rd(in_vec[18:18]),
    .a0(in_vec[17:17]),
    .din(in_vec[16:9]),
    .intp(in_vec[8:1]),
    .int_ack(in_vec[0:0]),
    .int_req(out_vec[9:9]),
    .int_vector(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h3de216;
    stim[1] = 23'h206d12;
    stim[2] = 23'h078632;
    stim[3] = 23'h5f98b7;
    stim[4] = 23'h064a87;
    stim[5] = 23'h5af0bf;
    stim[6] = 23'h10ab00;
    stim[7] = 23'h585b5b;
    stim[8] = 23'h53fcad;
    stim[9] = 23'h1c1dcb;
    stim[10] = 23'h49d382;
    stim[11] = 23'h09e02e;
    stim[12] = 23'h07c5f6;
    stim[13] = 23'h031b68;
    stim[14] = 23'h06d354;
    stim[15] = 23'h1eeef7;
    stim[16] = 23'h44d7dc;
    stim[17] = 23'h0167ea;
    stim[18] = 23'h1eaa1c;
    stim[19] = 23'h100426;
    stim[20] = 23'h427784;
    stim[21] = 23'h0f03cb;
    stim[22] = 23'h1b6c8b;
    stim[23] = 23'h5c661b;
    stim[24] = 23'h4b9757;
    stim[25] = 23'h4936fe;
    stim[26] = 23'h024e4a;
    stim[27] = 23'h5fe903;
    stim[28] = 23'h12d6b8;
    stim[29] = 23'h1227c0;
    stim[30] = 23'h07e1c6;
    stim[31] = 23'h54229a;
    stim[32] = 23'h590ccd;
    stim[33] = 23'h555e20;
    stim[34] = 23'h5f345a;
    stim[35] = 23'h4642d6;
    stim[36] = 23'h56476a;
    stim[37] = 23'h559d9b;
    stim[38] = 23'h559423;
    stim[39] = 23'h5c7b00;
    stim[40] = 23'h443264;
    stim[41] = 23'h48873e;
    stim[42] = 23'h1b7ea4;
    stim[43] = 23'h186418;
    stim[44] = 23'h450fb2;
    stim[45] = 23'h4c7816;
    stim[46] = 23'h065239;
    stim[47] = 23'h5abacf;
    stim[48] = 23'h041920;
    stim[49] = 23'h176ffd;
    stim[50] = 23'h14ff2b;
    stim[51] = 23'h43b554;
    stim[52] = 23'h4ce79a;
    stim[53] = 23'h448298;
    stim[54] = 23'h422b00;
    stim[55] = 23'h171d2b;
    stim[56] = 23'h53ea25;
    stim[57] = 23'h5a9275;
    stim[58] = 23'h0224b4;
    stim[59] = 23'h575bd4;
    stim[60] = 23'h021ccb;
    stim[61] = 23'h4fd5c3;
    stim[62] = 23'h1c2d2e;
    stim[63] = 23'h5be0f2;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h000;
      expv[7] = 10'h000;
      expv[8] = 10'h000;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h200;
      expv[54] = 10'h200;
      expv[55] = 10'h200;
      expv[56] = 10'h200;
      expv[57] = 10'h399;
      expv[58] = 10'h39d;
      expv[59] = 10'h39d;
      expv[60] = 10'h39d;
      expv[61] = 10'h39d;
      expv[62] = 10'h399;
      expv[63] = 10'h399;
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
