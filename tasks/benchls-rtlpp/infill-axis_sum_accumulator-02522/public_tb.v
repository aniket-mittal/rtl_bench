// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02522 dut (
    .ACLK(clk),
    .ARESETN(in_vec[35:35]),
    .S_AXIS_TDATA(in_vec[34:3]),
    .S_AXIS_TLAST(in_vec[2:2]),
    .S_AXIS_TVALID(in_vec[1:1]),
    .M_AXIS_TREADY(in_vec[0:0]),
    .S_AXIS_TREADY(out_vec[38:38]),
    .M_AXIS_TVALID(out_vec[37:37]),
    .M_AXIS_TDATA(out_vec[36:5]),
    .M_AXIS_TLAST(out_vec[4:4]),
    .M_AXIS_TKEEP(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h79d0a3caf;
    stim[1] = 36'h5023cd6a9;
    stim[2] = 36'heed648855;
    stim[3] = 36'hdcba058d7;
    stim[4] = 36'he68f86588;
    stim[5] = 36'hadf25cf23;
    stim[6] = 36'h8c13a3f78;
    stim[7] = 36'h82152eba1;
    stim[8] = 36'hd5ee76404;
    stim[9] = 36'hd67f5e1ac;
    stim[10] = 36'hee6f72790;
    stim[11] = 36'hc7b167525;
    stim[12] = 36'heb3c70467;
    stim[13] = 36'he74bfe539;
    stim[14] = 36'h96e88c9b6;
    stim[15] = 36'hea1f39fb8;
    stim[16] = 36'hafee2acfc;
    stim[17] = 36'hc82b47529;
    stim[18] = 36'ha4667b357;
    stim[19] = 36'hda79832a5;
    stim[20] = 36'h8a25c034b;
    stim[21] = 36'hb3c636f85;
    stim[22] = 36'hccdd05d24;
    stim[23] = 36'hdb8b2a9eb;
    stim[24] = 36'he60922c6c;
    stim[25] = 36'hca046ec65;
    stim[26] = 36'h9d65c4988;
    stim[27] = 36'ha806e8574;
    stim[28] = 36'hd50b82675;
    stim[29] = 36'h8631c6ab2;
    stim[30] = 36'hd5a8a4cbf;
    stim[31] = 36'hb2bae6121;
    stim[32] = 36'hb2d1c4c6b;
    stim[33] = 36'hf9f71e277;
    stim[34] = 36'hae7e5f3ae;
    stim[35] = 36'h8b6daec84;
    stim[36] = 36'he470c3610;
    stim[37] = 36'ha65d01b58;
    stim[38] = 36'hb4817da61;
    stim[39] = 36'h8f9db1801;
    stim[40] = 36'hffb39aeb9;
    stim[41] = 36'h8a587e99a;
    stim[42] = 36'hb450d6288;
    stim[43] = 36'h9ea6894f3;
    stim[44] = 36'haa534bcee;
    stim[45] = 36'h86d0d6b81;
    stim[46] = 36'hfe669a8ab;
    stim[47] = 36'hf149611a8;
    stim[48] = 36'hc5ce8dc0b;
    stim[49] = 36'h84a7c9fa5;
    stim[50] = 36'hbd8583c8b;
    stim[51] = 36'ha0af2e673;
    stim[52] = 36'haa54d1058;
    stim[53] = 36'hc48e677c5;
    stim[54] = 36'h008e55af8;
    stim[55] = 36'h9128bf971;
    stim[56] = 36'h808e58edc;
    stim[57] = 36'h99fdafde6;
    stim[58] = 36'hb0f755af0;
    stim[59] = 36'he93446a9b;
    stim[60] = 36'hc38b82995;
    stim[61] = 36'hde544b515;
    stim[62] = 36'hd2bfe39c7;
    stim[63] = 36'h9a30eb6e7;
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
      expv[0] = 39'hxxxxxxxxxf;
      expv[1] = 39'h000000000f;
      expv[2] = 39'h000000000f;
      expv[3] = 39'h000000000f;
      expv[4] = 39'h400000000f;
      expv[5] = 39'h400000000f;
      expv[6] = 39'h4b7c973c8f;
      expv[7] = 39'h4b7c973c8f;
      expv[8] = 39'h4b7c973c8f;
      expv[9] = 39'h4b7c973c8f;
      expv[10] = 39'h4b7c973c8f;
      expv[11] = 39'h4b7c973c8f;
      expv[12] = 39'h4b7c973c8f;
      expv[13] = 39'h464bb34e0f;
      expv[14] = 39'h464bb34e0f;
      expv[15] = 39'h4c05d674cf;
      expv[16] = 39'h4c05d674cf;
      expv[17] = 39'h4c05d674cf;
      expv[18] = 39'h4c05d674cf;
      expv[19] = 39'h551f75420f;
      expv[20] = 39'h551f75420f;
      expv[21] = 39'h57a8e54f2f;
      expv[22] = 39'h57a8e54f2f;
      expv[23] = 39'h57a8e54f2f;
      expv[24] = 39'h4e8baff6cf;
      expv[25] = 39'h4e8baff6cf;
      expv[26] = 39'h4e8baff6cf;
      expv[27] = 39'h4e8baff6cf;
      expv[28] = 39'h4e8baff6cf;
      expv[29] = 39'h4e8baff6cf;
      expv[30] = 39'h501821a18f;
      expv[31] = 39'h25824ad46f;
      expv[32] = 39'h25824ad46f;
      expv[33] = 39'h25824ad46f;
      expv[34] = 39'h25824ad46f;
      expv[35] = 39'h25824ad46f;
      expv[36] = 39'h25824ad46f;
      expv[37] = 39'h25824ad46f;
      expv[38] = 39'h25824ad46f;
      expv[39] = 39'h25824ad46f;
      expv[40] = 39'h25824ad46f;
      expv[41] = 39'h25824ad46f;
      expv[42] = 39'h25824ad46f;
      expv[43] = 39'h25824ad46f;
      expv[44] = 39'h25824ad46f;
      expv[45] = 39'h25824ad46f;
      expv[46] = 39'h05824ad46f;
      expv[47] = 39'h400000000f;
      expv[48] = 39'h400000000f;
      expv[49] = 39'h5173a3702f;
      expv[50] = 39'h5173a3702f;
      expv[51] = 39'h40d504624f;
      expv[52] = 39'h4900cffc0f;
      expv[53] = 39'h4900cffc0f;
      expv[54] = 39'h4900cffc0f;
      expv[55] = 39'h000000000f;
      expv[56] = 39'h000000000f;
      expv[57] = 39'h000000000f;
      expv[58] = 39'h400000000f;
      expv[59] = 39'h400000000f;
      expv[60] = 39'h5a4d11aa6f;
      expv[61] = 39'h5a4d11aa6f;
      expv[62] = 39'h5a4d11aa6f;
      expv[63] = 39'h4efd0a916f;
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
