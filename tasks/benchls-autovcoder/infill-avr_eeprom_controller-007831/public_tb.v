// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 23;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_007831 dut (
    .clk_i(clk),
    .rst_i(in_vec[47:47]),
    .addr_i(in_vec[46:39]),
    .wr_i(in_vec[38:38]),
    .rd_i(in_vec[37:37]),
    .bus_i(in_vec[36:29]),
    .int_ack_i(in_vec[28:28]),
    .ext_eep_addr_i(in_vec[27:11]),
    .ext_eep_data_i(in_vec[10:3]),
    .ext_eep_data_wr_i(in_vec[2:2]),
    .ext_eep_data_rd_i(in_vec[1:1]),
    .ext_eep_data_en_i(in_vec[0:0]),
    .bus_o(out_vec[22:15]),
    .int_o(out_vec[14:14]),
    .ext_eep_data_o(out_vec[13:6]),
    .content_modifyed_o(out_vec[5:5]),
    .debug_o(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'h9e21cb57d120;
    stim[1] = 48'h911bd94cc57a;
    stim[2] = 48'h3d0ab0684746;
    stim[3] = 48'h49e64708e6a7;
    stim[4] = 48'h3898e9ec7e5d;
    stim[5] = 48'h396e971b0c5f;
    stim[6] = 48'h37d25158e794;
    stim[7] = 48'h0e92d70ac963;
    stim[8] = 48'h6c6eb385d3a3;
    stim[9] = 48'h01776af0cc77;
    stim[10] = 48'h3951891b82a1;
    stim[11] = 48'h043c217ebb7a;
    stim[12] = 48'h38ec30caef0e;
    stim[13] = 48'h5c2fcceb047c;
    stim[14] = 48'h1bcc4ad643a7;
    stim[15] = 48'h5b1f77b9d245;
    stim[16] = 48'h5aa6785cbbfe;
    stim[17] = 48'h0f4e80fe0535;
    stim[18] = 48'h296a837774a2;
    stim[19] = 48'h56f78bf13ef5;
    stim[20] = 48'h3380a1104896;
    stim[21] = 48'h6d8f9716b019;
    stim[22] = 48'h31272b662691;
    stim[23] = 48'h076a643cd854;
    stim[24] = 48'h704eb9937198;
    stim[25] = 48'h20e96eb02de6;
    stim[26] = 48'h3dc12eeab727;
    stim[27] = 48'h5fcc926d1526;
    stim[28] = 48'h23abe2fbbb1f;
    stim[29] = 48'h6e4bef85e918;
    stim[30] = 48'h614f918096dd;
    stim[31] = 48'h2ee4cc9badbd;
    stim[32] = 48'h29005d1088b0;
    stim[33] = 48'h13429b9781d7;
    stim[34] = 48'h6a2eafb0381c;
    stim[35] = 48'h7c63678708c7;
    stim[36] = 48'h0ca3bba693fa;
    stim[37] = 48'h5bf7a26d8088;
    stim[38] = 48'h0acc6e32852b;
    stim[39] = 48'h4e741bb8b276;
    stim[40] = 48'h14506129dae6;
    stim[41] = 48'h1b74253720a5;
    stim[42] = 48'h6428788da160;
    stim[43] = 48'h7264f0e7e7f7;
    stim[44] = 48'h3e2c3397232b;
    stim[45] = 48'h65436c225d44;
    stim[46] = 48'h087331256b62;
    stim[47] = 48'h1d3faf18832b;
    stim[48] = 48'h1710ba7b7429;
    stim[49] = 48'h2043a357357f;
    stim[50] = 48'h216bc5953f1d;
    stim[51] = 48'h486e5ca9263e;
    stim[52] = 48'h06e6ab876c7c;
    stim[53] = 48'h12df2dd3a99b;
    stim[54] = 48'h1ddfa135e6b9;
    stim[55] = 48'h0de2b6c03387;
    stim[56] = 48'h08f2460fbafe;
    stim[57] = 48'h2cea5195ebbf;
    stim[58] = 48'h52b5e945ced1;
    stim[59] = 48'h7aac26f451d6;
    stim[60] = 48'h545ce2f4c384;
    stim[61] = 48'h1de86ec4d774;
    stim[62] = 48'h1b39597ec9c9;
    stim[63] = 48'h372e82c81e67;
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
      expv[0] = 23'h00x0xx;
      expv[1] = 23'h0000xx;
      expv[2] = 23'h0000xx;
      expv[3] = 23'h003fxx;
      expv[4] = 23'h0000xx;
      expv[5] = 23'h00xxxx;
      expv[6] = 23'h0000xx;
      expv[7] = 23'h003fxx;
      expv[8] = 23'h00xxxx;
      expv[9] = 23'h00xxxx;
      expv[10] = 23'h0000xx;
      expv[11] = 23'h0000xx;
      expv[12] = 23'h0000xx;
      expv[13] = 23'h0000xx;
      expv[14] = 23'h003fxx;
      expv[15] = 23'h0000xx;
      expv[16] = 23'h0000xx;
      expv[17] = 23'h0000xx;
      expv[18] = 23'h0000xx;
      expv[19] = 23'h0000xx;
      expv[20] = 23'h0000xx;
      expv[21] = 23'h0000xx;
      expv[22] = 23'h0000xx;
      expv[23] = 23'h0000xx;
      expv[24] = 23'h0000xx;
      expv[25] = 23'h0000xx;
      expv[26] = 23'h003fxx;
      expv[27] = 23'h0000xx;
      expv[28] = 23'h003fxx;
      expv[29] = 23'h0000xx;
      expv[30] = 23'h0000xx;
      expv[31] = 23'h0000xx;
      expv[32] = 23'h0000xx;
      expv[33] = 23'h003fxx;
      expv[34] = 23'h0000xx;
      expv[35] = 23'h003fxx;
      expv[36] = 23'h0000xx;
      expv[37] = 23'h0000xx;
      expv[38] = 23'h003fxx;
      expv[39] = 23'h0000xx;
      expv[40] = 23'h0000xx;
      expv[41] = 23'h0000xx;
      expv[42] = 23'h0000xx;
      expv[43] = 23'h003fxx;
      expv[44] = 23'h00xxxx;
      expv[45] = 23'h0000xx;
      expv[46] = 23'h0000xx;
      expv[47] = 23'h003fxx;
      expv[48] = 23'h0000xx;
      expv[49] = 23'h00xxxx;
      expv[50] = 23'h0000xx;
      expv[51] = 23'h0000xx;
      expv[52] = 23'h0000xx;
      expv[53] = 23'h003fxx;
      expv[54] = 23'h0000xx;
      expv[55] = 23'h00xxxx;
      expv[56] = 23'h0000xx;
      expv[57] = 23'h003fxx;
      expv[58] = 23'h0000xx;
      expv[59] = 23'h0000xx;
      expv[60] = 23'h0000xx;
      expv[61] = 23'h0000xx;
      expv[62] = 23'h0000xx;
      expv[63] = 23'h00xxxx;
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
