// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06047 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h35a76b2a;
    stim[1] = 31'h1ef18d24;
    stim[2] = 31'h5c944be2;
    stim[3] = 31'h782b3b09;
    stim[4] = 31'h6e1026de;
    stim[5] = 31'h79390894;
    stim[6] = 31'h7af2e187;
    stim[7] = 31'h5ceff592;
    stim[8] = 31'h4ed66c0f;
    stim[9] = 31'h4b39e35a;
    stim[10] = 31'h6cf3a103;
    stim[11] = 31'h787e1ccd;
    stim[12] = 31'h5b9e5fc7;
    stim[13] = 31'h515d95cc;
    stim[14] = 31'h4fd8ae17;
    stim[15] = 31'h4e25836d;
    stim[16] = 31'h5280a966;
    stim[17] = 31'h4685c451;
    stim[18] = 31'h537dc4ef;
    stim[19] = 31'h7d3e213e;
    stim[20] = 31'h76d28a00;
    stim[21] = 31'h64b4cce6;
    stim[22] = 31'h63c287f6;
    stim[23] = 31'h48af3e01;
    stim[24] = 31'h44a710fa;
    stim[25] = 31'h76b52ba4;
    stim[26] = 31'h7b0059d6;
    stim[27] = 31'h0936053f;
    stim[28] = 31'h467ac535;
    stim[29] = 31'h7e6e875f;
    stim[30] = 31'h5686b514;
    stim[31] = 31'h56451af4;
    stim[32] = 31'h4229ef27;
    stim[33] = 31'h20c3972f;
    stim[34] = 31'h74658365;
    stim[35] = 31'h56c7025f;
    stim[36] = 31'h77b4dcba;
    stim[37] = 31'h50d24736;
    stim[38] = 31'h4b8f9225;
    stim[39] = 31'h484ae597;
    stim[40] = 31'h77289987;
    stim[41] = 31'h53b4ceab;
    stim[42] = 31'h70c53091;
    stim[43] = 31'h5cd38561;
    stim[44] = 31'h40122e16;
    stim[45] = 31'h7b40cdaa;
    stim[46] = 31'h5c4b4a87;
    stim[47] = 31'h718de792;
    stim[48] = 31'h749a44c5;
    stim[49] = 31'h66d724be;
    stim[50] = 31'h4e9c7bf7;
    stim[51] = 31'h66ecd072;
    stim[52] = 31'h78495d81;
    stim[53] = 31'h42e5b42c;
    stim[54] = 31'h49378dce;
    stim[55] = 31'h631e9b9b;
    stim[56] = 31'h2b33ed3f;
    stim[57] = 31'h4967c2e0;
    stim[58] = 31'h4fc9d8ed;
    stim[59] = 31'h566e25ea;
    stim[60] = 31'h66988041;
    stim[61] = 31'h6fb0d579;
    stim[62] = 31'h6633eebc;
    stim[63] = 31'h4d23c19d;
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
      expv[0] = 36'hxxxxxxxxc;
      expv[1] = 36'hxxxxxxxx9;
      expv[2] = 36'hxxxxxxxx9;
      expv[3] = 36'hxxxxxxxx6;
      expv[4] = 36'h000001c93;
      expv[5] = 36'h0000034b9;
      expv[6] = 36'h0000002c6;
      expv[7] = 36'h000001c0e;
      expv[8] = 36'h000001c09;
      expv[9] = 36'h000001c04;
      expv[10] = 36'h000001c06;
      expv[11] = 36'h000006dfe;
      expv[12] = 36'h000003ae4;
      expv[13] = 36'h000003ae3;
      expv[14] = 36'h000003aee;
      expv[15] = 36'h000003ae9;
      expv[16] = 36'h000003ae4;
      expv[17] = 36'h000003ae6;
      expv[18] = 36'h000003aeb;
      expv[19] = 36'h000003ae1;
      expv[20] = 36'h000008ae3;
      expv[21] = 36'h000002823;
      expv[22] = 36'h000003efb;
      expv[23] = 36'h0000003be;
      expv[24] = 36'h0000003bc;
      expv[25] = 36'h0000003b1;
      expv[26] = 36'h0000014cb;
      expv[27] = 36'h000002b7b;
      expv[28] = 36'h000002b7b;
      expv[29] = 36'h000002b71;
      expv[30] = 36'h000000676;
      expv[31] = 36'h00000067e;
      expv[32] = 36'h00000067e;
      expv[33] = 36'h000000673;
      expv[34] = 36'h00000067c;
      expv[35] = 36'h000000001;
      expv[36] = 36'h000000003;
      expv[37] = 36'h000002b2e;
      expv[38] = 36'h000002b29;
      expv[39] = 36'h000002b21;
      expv[40] = 36'h000002b23;
      expv[41] = 36'h00000278e;
      expv[42] = 36'h000002789;
      expv[43] = 36'h000005263;
      expv[44] = 36'h000005263;
      expv[45] = 36'h00000526c;
      expv[46] = 36'h000004016;
      expv[47] = 36'h00000401b;
      expv[48] = 36'h0000037a9;
      expv[49] = 36'h000000931;
      expv[50] = 36'h000001dc4;
      expv[51] = 36'h000001dc6;
      expv[52] = 36'h00000333e;
      expv[53] = 36'h000003a2c;
      expv[54] = 36'h000003a29;
      expv[55] = 36'h000003a29;
      expv[56] = 36'h000001e9b;
      expv[57] = 36'h000001e9b;
      expv[58] = 36'h000001e9c;
      expv[59] = 36'h000001e94;
      expv[60] = 36'h000001e96;
      expv[61] = 36'h000002f9b;
      expv[62] = 36'h00000363e;
      expv[63] = 36'h0000005ec;
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
