// Hidden tests: 5000 cycles of seeded random inputs (seed 997510336); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 251;
  reg clk;
  reg [63:0] i_0;
  reg [49:0] i_1;
  reg [0:0] i_2;
  reg [2:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_079372 dut (
    .io_mem_resp_bits_data(i_0),
    .pte_addr(i_1),
    .r_req_store(i_2),
    .state(i_3),
    .s1_kill(i_4),
    .pte_reserved_for_hardware(out_dut[250:235]),
    .pte_ppn(out_dut[234:197]),
    .pte_reserved_for_software(out_dut[196:195]),
    .pte_d(out_dut[194:194]),
    .pte_a(out_dut[193:193]),
    .pte_g(out_dut[192:192]),
    .pte_u(out_dut[191:191]),
    .pte_x(out_dut[190:190]),
    .pte_w(out_dut[189:189]),
    .pte_r(out_dut[188:188]),
    .pte_v(out_dut[187:187]),
    .io_mem_req_bits_addr(out_dut[186:147]),
    .io_mem_req_bits_tag(out_dut[146:140]),
    .io_mem_req_bits_typ(out_dut[139:137]),
    .io_mem_req_bits_phys(out_dut[136:136]),
    .io_mem_req_bits_data(out_dut[135:72]),
    .io_mem_s1_kill(out_dut[71:71]),
    .io_mem_invalidate_lr(out_dut[70:70]),
    .io_mem_req_bits_cmd(out_dut[69:65]),
    .io_mem_req_valid(out_dut[64:64]),
    .io_mem_s1_data(out_dut[63:0])
  );
  autovcoder_079372__ref ref_i (
    .io_mem_resp_bits_data(i_0),
    .pte_addr(i_1),
    .r_req_store(i_2),
    .state(i_3),
    .s1_kill(i_4),
    .pte_reserved_for_hardware(out_ref[250:235]),
    .pte_ppn(out_ref[234:197]),
    .pte_reserved_for_software(out_ref[196:195]),
    .pte_d(out_ref[194:194]),
    .pte_a(out_ref[193:193]),
    .pte_g(out_ref[192:192]),
    .pte_u(out_ref[191:191]),
    .pte_x(out_ref[190:190]),
    .pte_w(out_ref[189:189]),
    .pte_r(out_ref[188:188]),
    .pte_v(out_ref[187:187]),
    .io_mem_req_bits_addr(out_ref[186:147]),
    .io_mem_req_bits_tag(out_ref[146:140]),
    .io_mem_req_bits_typ(out_ref[139:137]),
    .io_mem_req_bits_phys(out_ref[136:136]),
    .io_mem_req_bits_data(out_ref[135:72]),
    .io_mem_s1_kill(out_ref[71:71]),
    .io_mem_invalidate_lr(out_ref[70:70]),
    .io_mem_req_bits_cmd(out_ref[69:65]),
    .io_mem_req_valid(out_ref[64:64]),
    .io_mem_s1_data(out_ref[63:0])
  );

  task check;
    begin
      bad = 0;
      for (b = 0; b < OW; b = b + 1)
        if (out_ref[b] !== 1'bx && out_dut[b] !== out_ref[b]) bad = 1;
      if (bad) begin
        mismatches = mismatches + 1;
        if (shown < 10) begin
          $display("MISMATCH cycle %0d: expected=%h got=%h", c, out_ref, out_dut);
          shown = shown + 1;
        end
      end
    end
  endtask

  initial begin
    seed = 997510336;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed)};
      i_1 = {$random(seed), $random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
